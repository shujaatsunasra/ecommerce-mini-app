import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    required String title,
    required String description,
    required double price,
    required double discountPercentage,
    required double rating,
    required int stock,
    String? brand,
    required String category,
    String? thumbnail,
    @Default([]) List<String> images,
    @Default(false) bool isOffline,
    DateTime? cachedAt,
  }) = _Product;

  const Product._();

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  // Helper methods for business logic
  double get discountedPrice => price * (1 - discountPercentage / 100);
  
  bool get isInStock => stock > 0;
  
  bool get hasDiscount => discountPercentage > 0;
  
  String get formattedPrice => '\$${price.toStringAsFixed(2)}';
  
  String get formattedDiscountedPrice => '\$${discountedPrice.toStringAsFixed(2)}';
  
  String get displayBrand => brand ?? 'Unknown Brand';
  
  String get stockStatus {
    if (stock == 0) return 'Out of Stock';
    if (stock < 10) return 'Low Stock';
    return 'In Stock';
  }
  
  bool get isRecentlyCached {
    if (cachedAt == null) return false;
    return DateTime.now().difference(cachedAt!).inHours < 24;
  }
}
