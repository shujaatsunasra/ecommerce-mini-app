import 'package:freezed_annotation/freezed_annotation.dart';
import 'product.dart';

part 'product_list.freezed.dart';

@freezed
class ProductList with _$ProductList {
  const factory ProductList({
    required List<Product> products,
    required int total,
    required int skip,
    required int limit,
    required bool hasMore,
    @Default(false) bool isOffline,
    @Default('') String searchQuery,
    @Default({}) Map<String, String> filters,
    DateTime? lastUpdated,
  }) = _ProductList;

  const ProductList._();

  // Helper methods for pagination and filtering
  int get currentPage => (skip ~/ limit) + 1;
  
  int get totalPages => (total / limit).ceil();
  
  bool get isFirstPage => currentPage == 1;
  
  bool get isLastPage => currentPage >= totalPages;
  
  int get nextSkip => skip + limit;
  
  bool get hasFilters => filters.isNotEmpty || searchQuery.isNotEmpty;
  
  String get displayInfo {
    if (isOffline) {
      return 'Showing ${products.length} cached products';
    }
    return 'Showing ${products.length} of $total products';
  }
  
  ProductList copyWithOfflineData({
    required List<Product> offlineProducts,
    required bool isOffline,
  }) {
    return copyWith(
      products: offlineProducts,
      total: offlineProducts.length,
      hasMore: false,
      isOffline: isOffline,
      lastUpdated: DateTime.now(),
    );
  }
}
