import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/wishlist.dart';
import '../../../product/domain/entities/product.dart';

abstract class WishlistRepository {
  Future<Either<Failure, Wishlist>> getWishlist();
  Future<Either<Failure, Wishlist>> addToWishlist(Product product);
  Future<Either<Failure, Wishlist>> removeFromWishlist(Product product);
  Future<Either<Failure, bool>> isInWishlist(Product product);
  Future<Either<Failure, Wishlist>> clearWishlist();
}
