import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/wishlist_repository.dart';
import '../../domain/entities/wishlist.dart';
import 'wishlist_event.dart';
import 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final WishlistRepository _wishlistRepository;

  WishlistBloc(this._wishlistRepository) : super(const WishlistState.initial()) {
    on<LoadWishlist>(_onLoadWishlist);
    on<AddToWishlist>(_onAddToWishlist);
    on<RemoveFromWishlist>(_onRemoveFromWishlist);
    on<ClearWishlist>(_onClearWishlist);
  }

  Future<void> _onLoadWishlist(LoadWishlist event, Emitter<WishlistState> emit) async {
    emit(const WishlistState.loading());
    final result = await _wishlistRepository.getWishlist();
    result.fold(
      (failure) => emit(WishlistState.error(failure)),
      (wishlist) => emit(WishlistState.loaded(wishlist)),
    );
  }

  Future<void> _onAddToWishlist(AddToWishlist event, Emitter<WishlistState> emit) async {
    final result = await _wishlistRepository.addToWishlist(event.product);
    result.fold(
      (failure) => emit(WishlistState.error(failure)),
      (wishlist) => emit(WishlistState.loaded(wishlist)),
    );
  }

  Future<void> _onRemoveFromWishlist(RemoveFromWishlist event, Emitter<WishlistState> emit) async {
    final result = await _wishlistRepository.removeFromWishlist(event.product);
    result.fold(
      (failure) => emit(WishlistState.error(failure)),
      (wishlist) => emit(WishlistState.loaded(wishlist)),
    );
  }

  Future<void> _onClearWishlist(ClearWishlist event, Emitter<WishlistState> emit) async {
    final result = await _wishlistRepository.clearWishlist();
    result.fold(
      (failure) => emit(WishlistState.error(failure)),
      (_) => emit(const WishlistState.loaded(Wishlist(products: []))),
    );
  }
}
