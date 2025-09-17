import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../product/domain/entities/product.dart';

part 'wishlist.freezed.dart';
part 'wishlist.g.dart';

@freezed
class Wishlist with _$Wishlist {
  const factory Wishlist({
    @Default([]) List<Product> products,
  }) = _Wishlist;

  factory Wishlist.fromJson(Map<String, dynamic> json) => _$WishlistFromJson(json);

  const Wishlist._();

  bool get isEmpty => products.isEmpty;

  bool get isNotEmpty => products.isNotEmpty;

  bool contains(Product product) => products.any((p) => p.id == product.id);

  Wishlist addProduct(Product product) {
    if (contains(product)) return this;
    return copyWith(products: [...products, product]);
  }

  Wishlist removeProduct(Product product) {
    return copyWith(
      products: products.where((p) => p.id != product.id).toList(),
    );
  }
}
