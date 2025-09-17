import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/cart_repository.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository _cartRepository;

  CartBloc(this._cartRepository) : super(const CartState.initial()) {
    on<LoadCart>(_onLoadCart);
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<UpdateQuantity>(_onUpdateQuantity);
    on<ClearCart>(_onClearCart);
  }

  Future<void> _onLoadCart(LoadCart event, Emitter<CartState> emit) async {
    emit(const CartState.loading());

    final result = await _cartRepository.getCart();
    
    result.fold(
      (failure) => emit(CartState.error(failure.message ?? 'Failed to load cart')),
      (cart) => emit(CartState.success(cart)),
    );
  }

  Future<void> _onAddToCart(AddToCart event, Emitter<CartState> emit) async {
    final result = await _cartRepository.addToCart(
      event.product,
      event.quantity,
    );
    
    result.fold(
      (failure) => emit(CartState.error(failure.message ?? 'Failed to add to cart')),
      (cart) => emit(CartState.success(cart)),
    );
  }

  Future<void> _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) async {
    final result = await _cartRepository.removeFromCart(event.product);
    
    result.fold(
      (failure) => emit(CartState.error(failure.message ?? 'Failed to remove from cart')),
      (cart) => emit(CartState.success(cart)),
    );
  }

  Future<void> _onUpdateQuantity(UpdateQuantity event, Emitter<CartState> emit) async {
    final result = await _cartRepository.updateQuantity(
      event.product,
      event.quantity,
    );
    
    result.fold(
      (failure) => emit(CartState.error(failure.message ?? 'Failed to update quantity')),
      (cart) => emit(CartState.success(cart)),
    );
  }

  Future<void> _onClearCart(ClearCart event, Emitter<CartState> emit) async {
    final result = await _cartRepository.clearCart();
    
    result.fold(
      (failure) => emit(CartState.error(failure.message ?? 'Failed to clear cart')),
      (cart) => emit(CartState.success(cart)),
    );
  }
}
