import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/entities/product_list.dart';
import '../../domain/entities/product_filters.dart';
import 'product_list_event.dart';
import 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final ProductRepository _productRepository;
  final Connectivity _connectivity;

  ProductListBloc(this._productRepository, this._connectivity) : super(const ProductListState.initial()) {
    on<LoadProducts>(_onLoadProducts);
    on<LoadMoreProducts>(_onLoadMoreProducts);
    on<SearchProducts>(_onSearchProducts);
    on<FilterProducts>(_onFilterProducts);
    on<RefreshProducts>(_onRefreshProducts);
    on<ClearFilters>(_onClearFilters);
    on<RetryLoad>(_onRetryLoad);
  }

  Future<void> _onLoadProducts(LoadProducts event, Emitter<ProductListState> emit) async {
    emit(const ProductListState.loading());

    try {
      final result = await _productRepository.fetchProducts(
        limit: event.limit,
        skip: event.skip,
        search: event.search,
        filters: event.filters,
        productFilters: event.productFilters,
      );

      await result.fold(
        (failure) async {
          final isOffline = !await _isOnline();
          if (isOffline) {
            // Try to get cached data when offline
            final cachedResult = await _productRepository.getCachedProducts(
              searchQuery: event.search,
              filters: event.productFilters,
            );
            
            await cachedResult.fold(
              (cacheFailure) async {
                emit(ProductListState.error(
                  message: _getUserFriendlyErrorMessage(failure),
                  isOffline: true,
                ));
              },
              (cachedProductList) async {
                emit(ProductListState.success(
                  productList: cachedProductList,
                  isOffline: true,
                ));
              },
            );
          } else {
            emit(ProductListState.error(
              message: _getUserFriendlyErrorMessage(failure),
            ));
          }
        },
        (productList) async {
          final isOffline = !await _isOnline();
          emit(ProductListState.success(
            productList: productList,
            isOffline: isOffline,
          ));
        },
      );
    } catch (e) {
      emit(ProductListState.error(
        message: 'Oops! Something unexpected happened. Our team is on it! 🛠️',
      ));
    }
  }

  Future<void> _onLoadMoreProducts(LoadMoreProducts event, Emitter<ProductListState> emit) async {
    final currentState = state;
    
    if (currentState is! ProductListSuccess) return;
    
    if (!currentState.productList.hasMore) return;

    emit(ProductListState.loadingMore(
      productList: currentState.productList,
    ));

    try {
      final result = await _productRepository.fetchProducts(
        limit: 20,
        skip: currentState.productList.nextSkip,
        search: currentState.productList.searchQuery.isNotEmpty ? currentState.productList.searchQuery : null,
        filters: currentState.productList.filters.isNotEmpty ? currentState.productList.filters : null,
        productFilters: _extractProductFilters(currentState.productList),
      );

      await result.fold(
        (failure) async {
          final isOffline = !await _isOnline();
          emit(ProductListState.error(
            message: _getUserFriendlyErrorMessage(failure),
            productList: currentState.productList,
            isOffline: isOffline,
          ));
        },
        (newProductList) async {
          final isOffline = !await _isOnline();
          final updatedProductList = currentState.productList.copyWith(
            products: [...currentState.productList.products, ...newProductList.products],
            hasMore: newProductList.hasMore,
            lastUpdated: DateTime.now(),
          );
          
          emit(ProductListState.success(
            productList: updatedProductList,
            isOffline: isOffline,
          ));
        },
      );
    } catch (e) {
      emit(ProductListState.error(
        message: 'Failed to load more products. Try again! 🔄',
        productList: currentState.productList,
      ));
    }
  }

  Future<void> _onSearchProducts(SearchProducts event, Emitter<ProductListState> emit) async {
    emit(const ProductListState.loading());

    try {
      final result = await _productRepository.searchProducts(
        query: event.query,
        limit: 20,
        skip: 0,
        additionalFilters: event.additionalFilters,
      );

      await result.fold(
        (failure) async {
          final isOffline = !await _isOnline();
          if (isOffline) {
            // Try cached search
            final cachedResult = await _productRepository.getCachedProducts(
              searchQuery: event.query,
              filters: event.additionalFilters,
            );
            
            await cachedResult.fold(
              (cacheFailure) async => emit(ProductListState.empty(
                message: 'No cached results for "${event.query}". Check your connection! 📡',
                isOffline: true,
              )),
              (cachedProductList) async {
                if (cachedProductList.products.isEmpty) {
                  emit(ProductListState.empty(
                    message: 'Nothing matched "${event.query}" in your cached data. Try another search! 🔍',
                    isOffline: true,
                  ));
                } else {
                  emit(ProductListState.success(
                    productList: cachedProductList,
                    isOffline: true,
                  ));
                }
              },
            );
          } else {
            emit(ProductListState.error(
              message: _getUserFriendlyErrorMessage(failure),
            ));
          }
        },
        (productList) async {
          final isOffline = !await _isOnline();
          if (productList.products.isEmpty) {
            emit(ProductListState.empty(
              message: 'Nothing matched "${event.query}". Fashion loves surprises - try another search! ✨',
              isOffline: isOffline,
            ));
          } else {
            emit(ProductListState.success(
              productList: productList,
              isOffline: isOffline,
            ));
          }
        },
      );
    } catch (e) {
      emit(ProductListState.error(
        message: 'Search failed. Our search elves are working on it! 🔍',
      ));
    }
  }

  Future<void> _onFilterProducts(FilterProducts event, Emitter<ProductListState> emit) async {
    emit(const ProductListState.loading());

    try {
      final result = await _productRepository.fetchProducts(
        limit: 20,
        skip: 0,
        filters: event.filters,
        productFilters: event.productFilters,
      );

      await result.fold(
        (failure) async {
          final isOffline = !await _isOnline();
          if (isOffline) {
            // Try cached filtering
            final cachedResult = await _productRepository.getCachedProducts(
              filters: event.productFilters,
            );
            
            await cachedResult.fold(
              (cacheFailure) async => emit(ProductListState.error(
                message: 'No cached data available. Check your connection! 📡',
                isOffline: true,
              )),
              (cachedProductList) async {
                if (cachedProductList.products.isEmpty) {
                  emit(ProductListState.empty(
                    message: 'No products match your filters in cached data. Try different filters! 🎯',
                    isOffline: true,
                  ));
                } else {
                  emit(ProductListState.success(
                    productList: cachedProductList,
                    isOffline: true,
                  ));
                }
              },
            );
          } else {
            emit(ProductListState.error(
              message: _getUserFriendlyErrorMessage(failure),
            ));
          }
        },
        (productList) async {
          final isOffline = !await _isOnline();
          if (productList.products.isEmpty) {
            emit(ProductListState.empty(
              message: 'No products match your filters. Try adjusting them! 🎯',
              isOffline: isOffline,
            ));
          } else {
            emit(ProductListState.success(
              productList: productList,
              isOffline: isOffline,
            ));
          }
        },
      );
    } catch (e) {
      emit(ProductListState.error(
        message: 'Filtering failed. Our filter wizards are on it! 🧙‍♂️',
      ));
    }
  }

  Future<void> _onRefreshProducts(RefreshProducts event, Emitter<ProductListState> emit) async {
    final currentState = state;
    
    if (currentState is ProductListSuccess) {
      add(LoadProducts(
        limit: 20,
        skip: 0,
        search: currentState.productList.searchQuery.isNotEmpty ? currentState.productList.searchQuery : null,
        filters: currentState.productList.filters.isNotEmpty ? currentState.productList.filters : null,
        productFilters: _extractProductFilters(currentState.productList),
      ));
    } else {
      add(const LoadProducts());
    }
  }

  Future<void> _onClearFilters(ClearFilters event, Emitter<ProductListState> emit) async {
    add(const LoadProducts());
  }

  Future<void> _onRetryLoad(RetryLoad event, Emitter<ProductListState> emit) async {
    add(const LoadProducts());
  }

  Future<bool> _isOnline() async {
    final connectivityResults = await _connectivity.checkConnectivity();
    return !connectivityResults.contains(ConnectivityResult.none);
  }

  String _getUserFriendlyErrorMessage(dynamic failure) {
    final message = failure.message?.toString() ?? 'Unknown error';
    
    // Map technical errors to user-friendly messages
    if (message.contains('timeout')) {
      return 'Our servers are taking a coffee break ☕. Try again in a moment!';
    } else if (message.contains('connection')) {
      return 'No internet connection 📡. Check your WiFi and try again!';
    } else if (message.contains('server error')) {
      return 'Our team is fixing this right now 🛠️. Try again soon!';
    } else if (message.contains('not found')) {
      return 'This product seems to have vanished 🪄. Try refreshing!';
    } else if (message.contains('unauthorized')) {
      return 'Please log in again 🔐. Your session expired!';
    } else if (message.contains('forbidden')) {
      return 'You don\'t have permission for this 🚫. Contact support if this seems wrong!';
    } else if (message.contains('too many requests')) {
      return 'Slow down there, speed demon! 🏃‍♂️ Try again in a moment!';
    } else {
      return 'Hmm, looks like our shelves are hiding 🤔. Try again?';
    }
  }

  ProductFilters? _extractProductFilters(ProductList productList) {
    if (productList.filters.isEmpty) return null;
    
    return ProductFilters(
      searchQuery: productList.searchQuery,
      category: productList.filters['category'] ?? '',
      brand: productList.filters['brand'] ?? '',
      minPrice: double.tryParse(productList.filters['minPrice'] ?? '0') ?? 0.0,
      maxPrice: double.tryParse(productList.filters['maxPrice'] ?? '0') ?? 0.0,
      minRating: double.tryParse(productList.filters['minRating'] ?? '0') ?? 0.0,
      inStockOnly: productList.filters['inStock'] == 'true',
    );
  }
}