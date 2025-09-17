import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/product_filters.dart';

part 'product_list_event.freezed.dart';

@freezed
class ProductListEvent with _$ProductListEvent {
  const factory ProductListEvent.loadProducts({
    @Default(20) int limit,
    @Default(0) int skip,
    String? search,
    Map<String, String>? filters,
    ProductFilters? productFilters,
  }) = LoadProducts;

  const factory ProductListEvent.loadMoreProducts() = LoadMoreProducts;

  const factory ProductListEvent.searchProducts({
    required String query,
    ProductFilters? additionalFilters,
  }) = SearchProducts;

  const factory ProductListEvent.filterProducts({
    Map<String, String>? filters,
    ProductFilters? productFilters,
  }) = FilterProducts;

  const factory ProductListEvent.refreshProducts() = RefreshProducts;

  const factory ProductListEvent.clearFilters() = ClearFilters;

  const factory ProductListEvent.retryLoad() = RetryLoad;
}