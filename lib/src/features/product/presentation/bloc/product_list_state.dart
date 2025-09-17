import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/product_list.dart';

part 'product_list_state.freezed.dart';

@freezed
class ProductListState with _$ProductListState {
  const factory ProductListState.initial() = ProductListInitial;

  const factory ProductListState.loading() = ProductListLoading;

  const factory ProductListState.loadingMore({
    required ProductList productList,
  }) = ProductListLoadingMore;

  const factory ProductListState.success({
    required ProductList productList,
    @Default(false) bool isOffline,
  }) = ProductListSuccess;

  const factory ProductListState.error({
    required String message,
    ProductList? productList,
    @Default(false) bool isOffline,
  }) = ProductListError;

  const factory ProductListState.empty({
    required String message,
    @Default(false) bool isOffline,
  }) = ProductListEmpty;
}

extension ProductListStateExtension on ProductListState {
  bool get isLoading => this is ProductListLoading;
  
  bool get isLoadingMore => this is ProductListLoadingMore;
  
  bool get isSuccess => this is ProductListSuccess;
  
  bool get isError => this is ProductListError;
  
  bool get isEmpty => this is ProductListEmpty;
  
  bool get hasProducts => when(
    initial: () => false,
    loading: () => false,
    loadingMore: (productList) => productList.products.isNotEmpty,
    success: (productList, isOffline) => productList.products.isNotEmpty,
    error: (message, productList, isOffline) => productList?.products.isNotEmpty ?? false,
    empty: (message, isOffline) => false,
  );
  
  ProductList? get productList => when(
    initial: () => null,
    loading: () => null,
    loadingMore: (productList) => productList,
    success: (productList, isOffline) => productList,
    error: (message, productList, isOffline) => productList,
    empty: (message, isOffline) => null,
  );
  
  String get displayMessage => when(
    initial: () => '',
    loading: () => 'Loading amazing products...',
    loadingMore: (productList) => 'Loading more products...',
    success: (productList, isOffline) => isOffline 
        ? 'Showing cached products (offline)'
        : 'Products loaded successfully',
    error: (message, productList, isOffline) => message,
    empty: (message, isOffline) => message,
  );
  
  bool get canLoadMore => when(
    initial: () => false,
    loading: () => false,
    loadingMore: (productList) => productList.hasMore,
    success: (productList, isOffline) => productList.hasMore,
    error: (message, productList, isOffline) => productList?.hasMore ?? false,
    empty: (message, isOffline) => false,
  );
  
  bool get isOffline => when(
    initial: () => false,
    loading: () => false,
    loadingMore: (productList) => false,
    success: (productList, isOffline) => isOffline,
    error: (message, productList, isOffline) => isOffline,
    empty: (message, isOffline) => isOffline,
  );
}