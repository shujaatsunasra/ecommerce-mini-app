import 'package:freezed_annotation/freezed_annotation.dart';
import 'cart_item.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class Cart with _$Cart {
  const factory Cart({
    @Default([]) List<CartItem> items,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  const Cart._();

  double get totalAmount => items.fold(
    0.0,
    (sum, item) => sum + (item.product.price * item.quantity),
  );

  int get totalItems => items.fold(
    0,
    (sum, item) => sum + item.quantity,
  );

  bool get isEmpty => items.isEmpty;

  bool get isNotEmpty => items.isNotEmpty;
}
