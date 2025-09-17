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
    final mockProduct = const Product(
      id: 1,
      title: 'Test Product',
      description: 'Test Description',
      price: 100.0,
      discountPercentage: 10.0,
      rating: 4.5,
      stock: 50,
      brand: 'Test Brand',
      category: 'Test Category',
      thumbnail: 'https://example.com/thumb.jpg',
      images: ['https://example.com/img.jpg'],
    );

    final mockCartItem = CartItem(product: mockProduct, quantity: 2);
    final mockCart = Cart(items: [mockCartItem]);

    test('initial state should be initial', () {
      expect(cartBloc.state, const CartState.initial());
    });

    group('LoadCart', () {
      blocTest<CartBloc, CartState>(
        'emits [loading, success] when LoadCart is successful',
        build: () {
          when(mockCartRepository.getCart())
              .thenAnswer((_) async => Right(mockCart));
          return cartBloc;
        },
        act: (bloc) => bloc.add(const LoadCart()),
        expect: () => [
          const CartState.loading(),
          CartState.success(mockCart),
        ],
        verify: (_) {
          verify(mockCartRepository.getCart()).called(1);
        },
      );

      blocTest<CartBloc, CartState>(
        'emits [loading, error] when LoadCart fails',
        build: () {
          when(mockCartRepository.getCart())
              .thenAnswer((_) async => const Left(CacheFailure('Cache error')));
          return cartBloc;
        },
        act: (bloc) => bloc.add(const LoadCart()),
        expect: () => [
          const CartState.loading(),
          const CartState.error('Cache error'),
        ],
      );
    });

    group('AddToCart', () {
      blocTest<CartBloc, CartState>(
        'emits success when AddToCart is successful',
        build: () {
          when(mockCartRepository.addToCart(any, any))
              .thenAnswer((_) async => Right(mockCart));
          return cartBloc;
        },
        act: (bloc) => bloc.add(AddToCart(mockProduct, quantity: 1)),
        expect: () => [
          CartState.success(mockCart),
        ],
        verify: (_) {
          verify(mockCartRepository.addToCart(mockProduct, 1)).called(1);
        },
      );

      blocTest<CartBloc, CartState>(
        'emits error when AddToCart fails',
        build: () {
          when(mockCartRepository.addToCart(any, any))
              .thenAnswer((_) async => const Left(CacheFailure('Add to cart failed')));
          return cartBloc;
        },
        act: (bloc) => bloc.add(AddToCart(mockProduct, quantity: 1)),
        expect: () => [
          const CartState.error('Add to cart failed'),
        ],
      );
    });

    group('RemoveFromCart', () {
      blocTest<CartBloc, CartState>(
        'emits success when RemoveFromCart is successful',
        build: () {
          when(mockCartRepository.removeFromCart(any))
              .thenAnswer((_) async => Right(mockCart));
          return cartBloc;
        },
        act: (bloc) => bloc.add(RemoveFromCart(mockProduct)),
        expect: () => [
          CartState.success(mockCart),
        ],
        verify: (_) {
          verify(mockCartRepository.removeFromCart(mockProduct)).called(1);
        },
      );
    });

    group('UpdateQuantity', () {
      blocTest<CartBloc, CartState>(
        'emits success when UpdateQuantity is successful',
        build: () {
          when(mockCartRepository.updateQuantity(any, any))
              .thenAnswer((_) async => Right(mockCart));
          return cartBloc;
        },
        act: (bloc) => bloc.add(UpdateQuantity(mockProduct, 3)),
        expect: () => [
          CartState.success(mockCart),
        ],
        verify: (_) {
          verify(mockCartRepository.updateQuantity(mockProduct, 3)).called(1);
        },
      );
    });

    group('ClearCart', () {
      blocTest<CartBloc, CartState>(
        'emits success when ClearCart is successful',
        build: () {
          when(mockCartRepository.clearCart())
              .thenAnswer((_) async => const Right(Cart()));
          return cartBloc;
        },
        act: (bloc) => bloc.add(const ClearCart()),
        expect: () => [
          const CartState.success(Cart()),
        ],
        verify: (_) {
          verify(mockCartRepository.clearCart()).called(1);
        },
      );
    });
  });
}
