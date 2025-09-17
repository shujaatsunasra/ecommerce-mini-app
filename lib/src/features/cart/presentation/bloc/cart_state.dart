import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/cart.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;

  const factory CartState.loading() = _Loading;

  const factory CartState.success(Cart cart) = _Success;

  const factory CartState.error(String message) = _Error;
}
