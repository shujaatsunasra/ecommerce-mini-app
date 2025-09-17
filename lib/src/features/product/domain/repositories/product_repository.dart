import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/product.dart';
import '../entities/product_list.dart';
import '../entities/product_filters.dart';

abstract class ProductRepository {
  /// Fetch products with pagination, search, and filtering
  Future<Either<Failure, ProductList>> fetchProducts({
    int limit = 20,
    int skip = 0,
    String? search,
    Map<String, String>? filters,
    ProductFilters? productFilters,
  });

  /// Fetch a single product by ID
  Future<Either<Failure, Product>> fetchProductDetail(int id);

  /// Search products with advanced filtering
  Future<Either<Failure, ProductList>> searchProducts({
    required String query,
    int limit = 20,
    int skip = 0,
    ProductFilters? additionalFilters,
  });

  /// Get products by category with filtering
  Future<Either<Failure, ProductList>> getProductsByCategory({
    required String category,
    int limit = 20,
    int skip = 0,
    ProductFilters? additionalFilters,
  });

  /// Get all available categories

  /// Get cached products for offline use
  Future<Either<Failure, ProductList>> getCachedProducts({
    String? searchQuery,
    ProductFilters? filters,
  });

  /// Cache products for offline use
  Future<Either<Failure, void>> cacheProducts(List<Product> products);

  /// Cache a single product
  Future<Either<Failure, void>> cacheProduct(Product product);

  /// Clear all cached products
  Future<Either<Failure, void>> clearCache();

  /// Check if products are cached and fresh
  Future<bool> hasCachedProducts();

  /// Get cache timestamp
  Future<DateTime?> getCacheTimestamp();
}
