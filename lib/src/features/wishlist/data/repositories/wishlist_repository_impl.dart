import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/wishlist.dart';
import '../../domain/repositories/wishlist_repository.dart';
import '../../../product/domain/entities/product.dart';
import '../../../../common/storage/hive_storage_service.dart';

@Injectable(as: WishlistRepository)
class WishlistRepositoryImpl implements WishlistRepository {
  final HiveStorageService _storageService;

  WishlistRepositoryImpl(this._storageService);

  @override
  Future<Either<Failure, Wishlist>> getWishlist() async {
    try {
      final wishlist = await _storageService.getWishlist();
      return Right(wishlist);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Wishlist>> addToWishlist(Product product) async {
    try {
      final currentWishlist = await _storageService.getWishlist();
      final updatedWishlist = currentWishlist.addProduct(product);
      await _storageService.saveWishlist(updatedWishlist);
      return Right(updatedWishlist);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Wishlist>> removeFromWishlist(Product product) async {
    try {
      final currentWishlist = await _storageService.getWishlist();
      final updatedWishlist = currentWishlist.removeProduct(product);
      await _storageService.saveWishlist(updatedWishlist);
      return Right(updatedWishlist);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isInWishlist(Product product) async {
    try {
      final wishlist = await _storageService.getWishlist();
      return Right(wishlist.contains(product));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Wishlist>> clearWishlist() async {
    try {
      final emptyWishlist = const Wishlist();
      await _storageService.saveWishlist(emptyWishlist);
      return Right(emptyWishlist);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
