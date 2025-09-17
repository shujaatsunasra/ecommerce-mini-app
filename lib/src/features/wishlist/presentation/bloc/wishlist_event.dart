import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../product/domain/entities/product.dart';

part 'wishlist_event.freezed.dart';

@freezed
class WishlistEvent with _$WishlistEvent {
  const factory WishlistEvent.loadWishlist() = LoadWishlist;
  const factory WishlistEvent.addToWishlist(Product product) = AddToWishlist;
  const factory WishlistEvent.removeFromWishlist(Product product) = RemoveFromWishlist;
  const factory WishlistEvent.clearWishlist() = ClearWishlist;
}
