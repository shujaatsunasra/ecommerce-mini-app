import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/wishlist.dart';

part 'wishlist_state.freezed.dart';

@freezed
class WishlistState with _$WishlistState {
  const factory WishlistState.initial() = Initial;
  const factory WishlistState.loading() = Loading;
  const factory WishlistState.loaded(Wishlist wishlist) = Loaded;
  const factory WishlistState.error(Failure failure) = Error;
}
