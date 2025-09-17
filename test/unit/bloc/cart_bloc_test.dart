import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_mini_app/src/features/cart/domain/entities/cart.dart';
import 'package:ecommerce_mini_app/src/features/cart/domain/entities/cart_item.dart';
import 'package:ecommerce_mini_app/src/features/cart/domain/repositories/cart_repository.dart';
import 'package:ecommerce_mini_app/src/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:ecommerce_mini_app/src/features/cart/presentation/bloc/cart_event.dart';
import 'package:ecommerce_mini_app/src/features/cart/presentation/bloc/cart_state.dart';
import 'package:ecommerce_mini_app/src/features/product/domain/entities/product.dart';
import 'package:ecommerce_mini_app/src/core/errors/failures.dart';

import 'cart_bloc_test.mocks.dart';

@GenerateMocks([CartRepository])
void main() {
  late CartBloc cartBloc;
  late MockCartRepository mockCartRepository;

  setUp(() {
    mockCartRepository = MockCartRepository();
    cartBloc = CartBloc(mockCartRepository);
  });

  tearDown(() {
    cartBloc.close();
  });

  group('CartBloc', () {
    final testProduct = Product(
      id: 1,
      title: 'Test Product',
      description: 'Test Description',
      price: 29.99,
      discountPercentage: 10.0,
      rating: 4.5,
      stock: 100,
      brand: 'Test Brand',
      category: 'electronics',
      thumbnail: 'https://example.com/image.jpg',
      images: ['https://example.com/image.jpg'],
    );

    final testCart = Cart(items: [
      CartItem(product: testProduct, quantity: 1)
    ]);

    test('initial state should be CartInitial', () {
      expect(cartBloc.state, equals(const CartState.initial()));
    });

    group('LoadCart', () {
      blocTest<CartBloc, CartState>(
        'emits [loading, success] when LoadCart is successful',
        build: () {
          when(mockCartRepository.getCart())
              .thenAnswer((_) async => Right(testCart));
          return cartBloc;
        },
        act: (bloc) => bloc.add(const CartEvent.loadCart()),
        expect: () => [
          const CartState.loading(),
          CartState.success(testCart),
        ],
        verify: (_) {
          verify(mockCartRepository.getCart()).called(1);
        },
      );

      blocTest<CartBloc, CartState>(
        'emits [loading, error] when LoadCart fails',
        build: () {
          when(mockCartRepository.getCart())
              .thenAnswer((_) async => Left(ServerFailure('Server Error')));
          return cartBloc;
        },
        act: (bloc) => bloc.add(const CartEvent.loadCart()),
        expect: () => [
          const CartState.loading(),
          const CartState.error('Server Error'),
        ],
      );
    });

    group('AddToCart', () {
      blocTest<CartBloc, CartState>(
        'emits [success] when AddToCart is successful',
        build: () {
          when(mockCartRepository.addToCart(any, any))
              .thenAnswer((_) async => Right(testCart));
          return cartBloc;
        },
        act: (bloc) => bloc.add(CartEvent.addToCart(testProduct)),
        expect: () => [
          CartState.success(testCart),
        ],
        verify: (_) {
          verify(mockCartRepository.addToCart(testProduct, 1)).called(1);
        },
      );

      blocTest<CartBloc, CartState>(
        'emits [error] when AddToCart fails',
        build: () {
          when(mockCartRepository.addToCart(any, any))
              .thenAnswer((_) async => Left(ServerFailure('Add failed')));
          return cartBloc;
        },
        act: (bloc) => bloc.add(CartEvent.addToCart(testProduct)),
        expect: () => [
          const CartState.error('Add failed'),
        ],
      );
    });

    group('RemoveFromCart', () {
      blocTest<CartBloc, CartState>(
        'emits [success] when RemoveFromCart is successful',
        build: () {
          when(mockCartRepository.removeFromCart(any))
              .thenAnswer((_) async => Right(testCart));
          return cartBloc;
        },
        act: (bloc) => bloc.add(CartEvent.removeFromCart(testProduct)),
        expect: () => [
          CartState.success(testCart),
        ],
        verify: (_) {
          verify(mockCartRepository.removeFromCart(testProduct)).called(1);
        },
      );

      blocTest<CartBloc, CartState>(
        'emits [error] when RemoveFromCart fails',
        build: () {
          when(mockCartRepository.removeFromCart(any))
              .thenAnswer((_) async => Left(ServerFailure('Remove failed')));
          return cartBloc;
        },
        act: (bloc) => bloc.add(CartEvent.removeFromCart(testProduct)),
        expect: () => [
          const CartState.error('Remove failed'),
        ],
      );
    });

    group('UpdateQuantity', () {
      blocTest<CartBloc, CartState>(
        'emits [success] when UpdateQuantity is successful',
        build: () {
          when(mockCartRepository.updateQuantity(any, any))
              .thenAnswer((_) async => Right(testCart));
          return cartBloc;
        },
        act: (bloc) => bloc.add(CartEvent.updateQuantity(testProduct, 5)),
        expect: () => [
          CartState.success(testCart),
        ],
        verify: (_) {
          verify(mockCartRepository.updateQuantity(testProduct, 5)).called(1);
        },
      );

      blocTest<CartBloc, CartState>(
        'emits [error] when UpdateQuantity fails',
        build: () {
          when(mockCartRepository.updateQuantity(any, any))
              .thenAnswer((_) async => Left(ServerFailure('Update failed')));
          return cartBloc;
        },
        act: (bloc) => bloc.add(CartEvent.updateQuantity(testProduct, 5)),
        expect: () => [
          const CartState.error('Update failed'),
        ],
      );
    });

    group('ClearCart', () {
      blocTest<CartBloc, CartState>(
        'emits [success] when ClearCart is successful',
        build: () {
          when(mockCartRepository.clearCart())
              .thenAnswer((_) async => Right(testCart));
          return cartBloc;
        },
        act: (bloc) => bloc.add(const CartEvent.clearCart()),
        expect: () => [
          CartState.success(testCart),
        ],
        verify: (_) {
          verify(mockCartRepository.clearCart()).called(1);
        },
      );

      blocTest<CartBloc, CartState>(
        'emits [error] when ClearCart fails',
        build: () {
          when(mockCartRepository.clearCart())
              .thenAnswer((_) async => Left(ServerFailure('Clear failed')));
          return cartBloc;
        },
        act: (bloc) => bloc.add(const CartEvent.clearCart()),
        expect: () => [
          const CartState.error('Clear failed'),
        ],
      );
    });
  });
}