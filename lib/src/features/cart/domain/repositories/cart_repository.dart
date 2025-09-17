import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/cart.dart';
import '../../../product/domain/entities/product.dart';

abstract class CartRepository {
  Future<Either<Failure, Cart>> getCart();
  Future<Either<Failure, Cart>> addToCart(Product product, int quantity);
  Future<Either<Failure, Cart>> removeFromCart(Product product);
  Future<Either<Failure, Cart>> updateQuantity(Product product, int quantity);
  Future<Either<Failure, Cart>> clearCart();
}
