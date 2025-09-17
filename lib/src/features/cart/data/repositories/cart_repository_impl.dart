import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/cart.dart';
import '../../domain/entities/cart_item.dart';
import '../../domain/repositories/cart_repository.dart';
import '../../../product/domain/entities/product.dart';
import '../../../../common/storage/hive_storage_service.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final HiveStorageService _storageService;

  CartRepositoryImpl(this._storageService);

  @override
  Future<Either<Failure, Cart>> getCart() async {
    try {
      final cart = await _storageService.getCart();
      return Right(cart);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Cart>> addToCart(Product product, int quantity) async {
    try {
      final currentCart = await _storageService.getCart();
      final existingItemIndex = currentCart.items.indexWhere(
        (item) => item.product.id == product.id,
      );

      List<CartItem> updatedItems;
      if (existingItemIndex != -1) {
        updatedItems = List.from(currentCart.items);
        updatedItems[existingItemIndex] = CartItem(
          product: product,
          quantity: currentCart.items[existingItemIndex].quantity + quantity,
        );
      } else {
        updatedItems = [
          ...currentCart.items,
          CartItem(product: product, quantity: quantity),
        ];
      }

      final updatedCart = Cart(items: updatedItems);
      await _storageService.saveCart(updatedCart);
      return Right(updatedCart);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Cart>> removeFromCart(Product product) async {
    try {
      final currentCart = await _storageService.getCart();
      final updatedItems = currentCart.items
          .where((item) => item.product.id != product.id)
          .toList();

      final updatedCart = Cart(items: updatedItems);
      await _storageService.saveCart(updatedCart);
      return Right(updatedCart);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Cart>> updateQuantity(Product product, int quantity) async {
    try {
      if (quantity <= 0) {
        return removeFromCart(product);
      }

      final currentCart = await _storageService.getCart();
      final existingItemIndex = currentCart.items.indexWhere(
        (item) => item.product.id == product.id,
      );

      if (existingItemIndex == -1) {
        return Left(CacheFailure('Product not found in cart'));
      }

      final updatedItems = <CartItem>[...currentCart.items];
      updatedItems[existingItemIndex] = CartItem(
        product: product,
        quantity: quantity,
      );

      final updatedCart = Cart(items: updatedItems);
      await _storageService.saveCart(updatedCart);
      return Right(updatedCart);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Cart>> clearCart() async {
    try {
      final emptyCart = const Cart();
      await _storageService.saveCart(emptyCart);
      return Right(emptyCart);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
