import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../product/domain/entities/product.dart';

part 'cart_event.freezed.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.loadCart() = LoadCart;

  const factory CartEvent.addToCart(Product product, {@Default(1) int quantity}) = AddToCart;

  const factory CartEvent.removeFromCart(Product product) = RemoveFromCart;

  const factory CartEvent.updateQuantity(Product product, int quantity) = UpdateQuantity;

  const factory CartEvent.clearCart() = ClearCart;
}
