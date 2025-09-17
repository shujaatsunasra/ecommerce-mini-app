import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/product_list.dart';
import '../../domain/entities/product_filters.dart';
import '../../domain/repositories/product_repository.dart';
import '../../../../common/models/api_response.dart';
import '../../../../common/api/api_endpoints.dart';
import '../../../../common/storage/hive_storage_service.dart';
import '../datasources/product_api_client.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductApiClient _apiClient;
  final HiveStorageService _storageService;
  final Connectivity _connectivity;

  ProductRepositoryImpl(this._apiClient, this._storageService, this._connectivity);

  @override
  Future<Either<Failure, ProductList>> fetchProducts({
    int limit = 20,
    int skip = 0,
    String? search,
    Map<String, String>? filters,
    ProductFilters? productFilters,
  }) async {
    try {
      final isOnline = await _isOnline();
      
      if (!isOnline) {
        return await _getCachedProductsWithFallback(search, productFilters);
      }

      final queryParams = _buildQueryParams(
        limit: limit,
        skip: skip,
        search: search,
        filters: filters,
        productFilters: productFilters,
      );

      final response = await _apiClient.dio.get(
        ApiEndpoints.products,
        queryParameters: queryParams,
      );


      final apiResponse = ApiResponse<Product>.fromJson(
        response.data,
        (json) {
          try {
            return Product.fromJson(json as Map<String, dynamic>);
          } catch (e) {
            rethrow;
          }
        },
      );

      final productList = ProductList(
        products: apiResponse.items,
        total: apiResponse.total,
        skip: apiResponse.skip,
        limit: apiResponse.limit,
        hasMore: (apiResponse.skip + apiResponse.items.length) < apiResponse.total,
        searchQuery: search ?? '',
        filters: filters ?? {},
        lastUpdated: DateTime.now(),
      );

      // Cache products for offline use
      await _cacheProducts(apiResponse.items);

      return Right(productList);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.code));
    } on NetworkException catch (e) {
      // Try to return cached data when offline
      return await _getCachedProductsWithFallback(search, productFilters);
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Product>> fetchProductDetail(int id) async {
    try {
      final isOnline = await _isOnline();
      
      // Try cache first for better UX
      final cachedProduct = await _getCachedProduct(id);
      if (cachedProduct != null && !isOnline) {
        return Right(cachedProduct.copyWith(isOffline: true));
      }

      final response = await _apiClient.dio.get(ApiEndpoints.productById(id));
      final product = Product.fromJson(response.data);

      // Cache the product
      await _cacheProduct(product);

      return Right(product);
    } on ServerException catch (e) {
      // Try to return cached product on server error
      final cachedProduct = await _getCachedProduct(id);
      if (cachedProduct != null) {
        return Right(cachedProduct.copyWith(isOffline: true));
      }
      return Left(ServerFailure(e.message, e.code));
    } on NetworkException catch (e) {
      // Return cached product when offline
      final cachedProduct = await _getCachedProduct(id);
      if (cachedProduct != null) {
        return Right(cachedProduct.copyWith(isOffline: true));
      }
      return Left(NetworkFailure(e.message, e.code));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ProductList>> searchProducts({
    required String query,
    int limit = 20,
    int skip = 0,
    ProductFilters? additionalFilters,
  }) async {
    try {
      final isOnline = await _isOnline();
      
      if (!isOnline) {
        return await _getCachedProductsWithFallback(query, additionalFilters);
      }

      final queryParams = <String, dynamic>{
        'q': query,
        'limit': limit,
        'skip': skip,
        ...?additionalFilters?.toQueryParams(),
      };

      final response = await _apiClient.dio.get(
        ApiEndpoints.searchProducts(query),
        queryParameters: queryParams,
      );

      final apiResponse = ApiResponse<Product>.fromJson(
        response.data,
        (json) => Product.fromJson(json as Map<String, dynamic>),
      );

      final productList = ProductList(
        products: apiResponse.items,
        total: apiResponse.total,
        skip: apiResponse.skip,
        limit: apiResponse.limit,
        hasMore: (apiResponse.skip + apiResponse.items.length) < apiResponse.total,
        searchQuery: query,
        filters: additionalFilters?.toQueryParams() ?? {},
        lastUpdated: DateTime.now(),
      );

      return Right(productList);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.code));
    } on NetworkException catch (e) {
      return await _getCachedProductsWithFallback(query, additionalFilters);
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, ProductList>> getProductsByCategory({
    required String category,
    int limit = 20,
    int skip = 0,
    ProductFilters? additionalFilters,
  }) async {
    try {
      final isOnline = await _isOnline();
      
      if (!isOnline) {
        return await _getCachedProductsWithFallback(null, additionalFilters?.copyWith(category: category));
      }

      final queryParams = <String, dynamic>{
        'limit': limit,
        'skip': skip,
        ...?additionalFilters?.toQueryParams(),
      };

      final response = await _apiClient.dio.get(
        ApiEndpoints.productsByCategory(category),
        queryParameters: queryParams,
      );

      final apiResponse = ApiResponse<Product>.fromJson(
        response.data,
        (json) => Product.fromJson(json as Map<String, dynamic>),
      );

      final productList = ProductList(
        products: apiResponse.items,
        total: apiResponse.total,
        skip: apiResponse.skip,
        limit: apiResponse.limit,
        hasMore: (apiResponse.skip + apiResponse.items.length) < apiResponse.total,
        searchQuery: '',
        filters: {category: category, ...?additionalFilters?.toQueryParams()},
        lastUpdated: DateTime.now(),
      );

      return Right(productList);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.code));
    } on NetworkException catch (e) {
      return await _getCachedProductsWithFallback(null, additionalFilters?.copyWith(category: category));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }



  @override
  Future<Either<Failure, ProductList>> getCachedProducts({
    String? searchQuery,
    ProductFilters? filters,
  }) async {
    try {
      final cachedProducts = await _storageService.getCachedProducts();
      
      if (cachedProducts.isEmpty) {
        return Left(CacheFailure('No cached products available'));
      }

      var filteredProducts = cachedProducts;

      // Apply search filter
      if (searchQuery != null && searchQuery.isNotEmpty) {
        filteredProducts = cachedProducts.where((product) =>
          product.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
          product.description.toLowerCase().contains(searchQuery.toLowerCase()) ||
          (product.brand?.toLowerCase().contains(searchQuery.toLowerCase()) ?? false) ||
          product.category.toLowerCase().contains(searchQuery.toLowerCase())
        ).toList();
      }

      // Apply additional filters
      if (filters != null) {
        filteredProducts = _applyFilters(filteredProducts, filters);
      }

      final productList = ProductList(
        products: filteredProducts,
        total: filteredProducts.length,
        skip: 0,
        limit: filteredProducts.length,
        hasMore: false,
        isOffline: true,
        searchQuery: searchQuery ?? '',
        filters: filters?.toQueryParams() ?? {},
        lastUpdated: await _storageService.getCacheTimestamp(),
      );

      return Right(productList);
    } catch (e) {
      return Left(CacheFailure('Failed to get cached products: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> cacheProducts(List<Product> products) async {
    try {
      await _storageService.cacheProducts(products);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to cache products: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> cacheProduct(Product product) async {
    try {
      await _storageService.cacheProduct(product);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to cache product: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> clearCache() async {
    try {
      await _storageService.clearProductCache();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear cache: ${e.toString()}'));
    }
  }

  @override
  Future<bool> hasCachedProducts() async {
    try {
      final cachedProducts = await _storageService.getCachedProducts();
      return cachedProducts.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<DateTime?> getCacheTimestamp() async {
    try {
      return await _storageService.getCacheTimestamp();
    } catch (e) {
      return null;
    }
  }

  // Helper methods
  Future<bool> _isOnline() async {
    final connectivityResults = await _connectivity.checkConnectivity();
    return !connectivityResults.contains(ConnectivityResult.none);
  }

  Map<String, dynamic> _buildQueryParams({
    required int limit,
    required int skip,
    String? search,
    Map<String, String>? filters,
    ProductFilters? productFilters,
  }) {
    final params = <String, dynamic>{
      'limit': limit,
      'skip': skip,
    };

    if (search != null && search.isNotEmpty) {
      params['q'] = search;
    }

    if (filters != null) {
      params.addAll(filters);
    }

    if (productFilters != null) {
      params.addAll(productFilters.toQueryParams());
    }

    return params;
  }

  Future<Either<Failure, ProductList>> _getCachedProductsWithFallback(
    String? searchQuery,
    ProductFilters? filters,
  ) async {
    final cachedResult = await getCachedProducts(
      searchQuery: searchQuery,
      filters: filters,
    );

    return cachedResult.fold(
      (failure) => Left(NetworkFailure('No internet connection and no cached data available')),
      (productList) => Right(productList),
    );
  }

  Future<Product?> _getCachedProduct(int id) async {
    try {
      return await _storageService.getCachedProduct(id);
    } catch (e) {
      return null;
    }
  }

  Future<void> _cacheProducts(List<Product> products) async {
    try {
      await _storageService.cacheProducts(products);
    } catch (e) {
      // Silently fail caching - don't break the main flow
    }
  }

  Future<void> _cacheProduct(Product product) async {
    try {
      await _storageService.cacheProduct(product);
    } catch (e) {
      // Silently fail caching - don't break the main flow
    }
  }

  List<Product> _applyFilters(List<Product> products, ProductFilters filters) {
    var filtered = products;

    if (filters.category.isNotEmpty) {
      filtered = filtered.where((p) => p.category == filters.category).toList();
    }

    if (filters.brand.isNotEmpty) {
      filtered = filtered.where((p) => p.brand == filters.brand).toList();
    }

    if (filters.minPrice > 0) {
      filtered = filtered.where((p) => p.price >= filters.minPrice).toList();
    }

    if (filters.maxPrice > 0) {
      filtered = filtered.where((p) => p.price <= filters.maxPrice).toList();
    }

    if (filters.minRating > 0) {
      filtered = filtered.where((p) => p.rating >= filters.minRating).toList();
    }

    if (filters.inStockOnly) {
      filtered = filtered.where((p) => p.stock > 0).toList();
    }

    // Apply sorting
    switch (filters.sortBy) {
      case SortBy.price:
        filtered.sort((a, b) => filters.sortOrder == SortOrder.asc 
            ? a.price.compareTo(b.price) 
            : b.price.compareTo(a.price));
        break;
      case SortBy.rating:
        filtered.sort((a, b) => filters.sortOrder == SortOrder.asc 
            ? a.rating.compareTo(b.rating) 
            : b.rating.compareTo(a.rating));
        break;
      case SortBy.title:
        filtered.sort((a, b) => filters.sortOrder == SortOrder.asc 
            ? a.title.compareTo(b.title) 
            : b.title.compareTo(a.title));
        break;
      case SortBy.brand:
        filtered.sort((a, b) => filters.sortOrder == SortOrder.asc 
            ? (a.brand ?? '').compareTo(b.brand ?? '') 
            : (b.brand ?? '').compareTo(a.brand ?? ''));
        break;
      case SortBy.category:
        filtered.sort((a, b) => filters.sortOrder == SortOrder.asc 
            ? a.category.compareTo(b.category) 
            : b.category.compareTo(a.category));
        break;
      case SortBy.stock:
        filtered.sort((a, b) => filters.sortOrder == SortOrder.asc 
            ? a.stock.compareTo(b.stock) 
            : b.stock.compareTo(a.stock));
        break;
      case SortBy.relevance:
      default:
        // Keep original order for relevance
        break;
    }

    return filtered;
  }
}