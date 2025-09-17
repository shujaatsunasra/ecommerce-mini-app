import 'package:bloc_test/bloc_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ecommerce_mini_app/src/features/product/domain/entities/product.dart';
import 'package:ecommerce_mini_app/src/features/product/domain/entities/product_list.dart';
import 'package:ecommerce_mini_app/src/features/product/domain/repositories/product_repository.dart';
import 'package:ecommerce_mini_app/src/features/product/presentation/bloc/product_list_bloc.dart';
import 'package:ecommerce_mini_app/src/features/product/presentation/bloc/product_list_event.dart';
import 'package:ecommerce_mini_app/src/features/product/presentation/bloc/product_list_state.dart';
import 'package:ecommerce_mini_app/src/core/errors/failures.dart';

import 'product_list_bloc_test.mocks.dart';

@GenerateMocks([ProductRepository, Connectivity])
void main() {
  late ProductListBloc productListBloc;
  late MockProductRepository mockProductRepository;
  late MockConnectivity mockConnectivity;

  setUp(() {
    mockProductRepository = MockProductRepository();
    mockConnectivity = MockConnectivity();
    productListBloc = ProductListBloc(mockProductRepository, mockConnectivity);
  });

  tearDown(() {
    productListBloc.close();
  });

  group('ProductListBloc', () {
    final sampleProducts = [
      const Product(
        id: 1,
        title: 'Test Product 1',
        description: 'Test Description 1',
        price: 100.0,
        discountPercentage: 10.0,
        rating: 4.5,
        stock: 10,
        brand: 'Test Brand',
        category: 'Test Category',
        thumbnail: 'https://example.com/image1.jpg',
      ),
      const Product(
        id: 2,
        title: 'Test Product 2',
        description: 'Test Description 2',
        price: 200.0,
        discountPercentage: 0.0,
        rating: 4.0,
        stock: 5,
        brand: 'Test Brand 2',
        category: 'Test Category 2',
        thumbnail: 'https://example.com/image2.jpg',
      ),
    ];

    final sampleProductList = ProductList(
      products: sampleProducts,
      total: 2,
      skip: 0,
      limit: 20,
      hasMore: false,
    );

    group('LoadProducts', () {
      blocTest<ProductListBloc, ProductListState>(
        'emits [loading, success] when products are loaded successfully',
        build: () {
          when(mockConnectivity.checkConnectivity())
              .thenAnswer((_) async => [ConnectivityResult.wifi]);
          when(mockProductRepository.fetchProducts(
            limit: anyNamed('limit'),
            skip: anyNamed('skip'),
            search: anyNamed('search'),
            filters: anyNamed('filters'),
            productFilters: anyNamed('productFilters'),
          )).thenAnswer((_) async => Right(sampleProductList));
          return productListBloc;
        },
        act: (bloc) => bloc.add(const LoadProducts()),
        expect: () => [
          const ProductListState.loading(),
          ProductListState.success(
            productList: sampleProductList,
            isOffline: false,
          ),
        ],
      );

      blocTest<ProductListBloc, ProductListState>(
        'emits [loading, error] when products fail to load',
        build: () {
          when(mockConnectivity.checkConnectivity())
              .thenAnswer((_) async => [ConnectivityResult.wifi]);
          when(mockProductRepository.fetchProducts(
            limit: anyNamed('limit'),
            skip: anyNamed('skip'),
            search: anyNamed('search'),
            filters: anyNamed('filters'),
            productFilters: anyNamed('productFilters'),
          )).thenAnswer((_) async => Left(ServerFailure('Server error')));
          return productListBloc;
        },
        act: (bloc) => bloc.add(const LoadProducts()),
        expect: () => [
          const ProductListState.loading(),
          const ProductListState.error(
            message: 'Hmm, looks like our shelves are hiding 🤔. Try again?',
          ),
        ],
      );

      blocTest<ProductListBloc, ProductListState>(
        'emits [loading, success with offline data] when offline and cached data available',
        build: () {
          when(mockConnectivity.checkConnectivity())
              .thenAnswer((_) async => [ConnectivityResult.none]);
          when(mockProductRepository.fetchProducts(
            limit: anyNamed('limit'),
            skip: anyNamed('skip'),
            search: anyNamed('search'),
            filters: anyNamed('filters'),
            productFilters: anyNamed('productFilters'),
          )).thenAnswer((_) async => Left(NetworkFailure('No internet')));
          when(mockProductRepository.getCachedProducts(
            searchQuery: anyNamed('searchQuery'),
            filters: anyNamed('filters'),
          )).thenAnswer((_) async => Right(sampleProductList));
          return productListBloc;
        },
        act: (bloc) => bloc.add(const LoadProducts()),
        expect: () => [
          const ProductListState.loading(),
          ProductListState.success(
            productList: sampleProductList,
            isOffline: true,
          ),
        ],
      );
    });

    group('LoadMoreProducts', () {
      blocTest<ProductListBloc, ProductListState>(
        'does not emit when hasMore is false',
        build: () {
          return productListBloc;
        },
        seed: () => ProductListState.success(
          productList: sampleProductList.copyWith(hasMore: false),
          isOffline: false,
        ),
        act: (bloc) => bloc.add(const LoadMoreProducts()),
        expect: () => [],
      );
    });

    group('SearchProducts', () {
      blocTest<ProductListBloc, ProductListState>(
        'emits [loading, success] when search is successful',
        build: () {
          when(mockConnectivity.checkConnectivity())
              .thenAnswer((_) async => [ConnectivityResult.wifi]);
          when(mockProductRepository.searchProducts(
            query: anyNamed('query'),
            limit: anyNamed('limit'),
            skip: anyNamed('skip'),
            additionalFilters: anyNamed('additionalFilters'),
          )).thenAnswer((_) async => Right(sampleProductList));
          return productListBloc;
        },
        act: (bloc) => bloc.add(const SearchProducts(query: 'test')),
        expect: () => [
          const ProductListState.loading(),
          ProductListState.success(
            productList: sampleProductList,
            isOffline: false,
          ),
        ],
      );

      blocTest<ProductListBloc, ProductListState>(
        'emits [loading, empty] when search returns no results',
        build: () {
          when(mockConnectivity.checkConnectivity())
              .thenAnswer((_) async => [ConnectivityResult.wifi]);
          when(mockProductRepository.searchProducts(
            query: anyNamed('query'),
            limit: anyNamed('limit'),
            skip: anyNamed('skip'),
            additionalFilters: anyNamed('additionalFilters'),
          )).thenAnswer((_) async => Right(sampleProductList.copyWith(products: [])));
          return productListBloc;
        },
        act: (bloc) => bloc.add(const SearchProducts(query: 'nonexistent')),
        expect: () => [
          const ProductListState.loading(),
          const ProductListState.empty(
            message: 'Nothing matched "nonexistent". Fashion loves surprises - try another search! ✨',
            isOffline: false,
          ),
        ],
      );
    });

    group('FilterProducts', () {
      blocTest<ProductListBloc, ProductListState>(
        'emits [loading, success] when filtering is successful',
        build: () {
          when(mockConnectivity.checkConnectivity())
              .thenAnswer((_) async => [ConnectivityResult.wifi]);
          when(mockProductRepository.fetchProducts(
            limit: anyNamed('limit'),
            skip: anyNamed('skip'),
            search: anyNamed('search'),
            filters: anyNamed('filters'),
            productFilters: anyNamed('productFilters'),
          )).thenAnswer((_) async => Right(sampleProductList));
          return productListBloc;
        },
        act: (bloc) => bloc.add(const FilterProducts()),
        expect: () => [
          const ProductListState.loading(),
          ProductListState.success(
            productList: sampleProductList,
            isOffline: false,
          ),
        ],
      );
    });

    group('RefreshProducts', () {
      blocTest<ProductListBloc, ProductListState>(
        'triggers LoadProducts event',
        build: () {
          when(mockConnectivity.checkConnectivity())
              .thenAnswer((_) async => [ConnectivityResult.wifi]);
          when(mockProductRepository.fetchProducts(
            limit: anyNamed('limit'),
            skip: anyNamed('skip'),
            search: anyNamed('search'),
            filters: anyNamed('filters'),
            productFilters: anyNamed('productFilters'),
          )).thenAnswer((_) async => Right(sampleProductList));
          return productListBloc;
        },
        act: (bloc) => bloc.add(const RefreshProducts()),
        expect: () => [
          const ProductListState.loading(),
          ProductListState.success(
            productList: sampleProductList,
            isOffline: false,
          ),
        ],
      );
    });

    group('ClearFilters', () {
      blocTest<ProductListBloc, ProductListState>(
        'triggers LoadProducts event',
        build: () {
          when(mockConnectivity.checkConnectivity())
              .thenAnswer((_) async => [ConnectivityResult.wifi]);
          when(mockProductRepository.fetchProducts(
            limit: anyNamed('limit'),
            skip: anyNamed('skip'),
            search: anyNamed('search'),
            filters: anyNamed('filters'),
            productFilters: anyNamed('productFilters'),
          )).thenAnswer((_) async => Right(sampleProductList));
          return productListBloc;
        },
        act: (bloc) => bloc.add(const ClearFilters()),
        expect: () => [
          const ProductListState.loading(),
          ProductListState.success(
            productList: sampleProductList,
            isOffline: false,
          ),
        ],
      );
    });

    group('RetryLoad', () {
      blocTest<ProductListBloc, ProductListState>(
        'triggers LoadProducts event',
        build: () {
          when(mockConnectivity.checkConnectivity())
              .thenAnswer((_) async => [ConnectivityResult.wifi]);
          when(mockProductRepository.fetchProducts(
            limit: anyNamed('limit'),
            skip: anyNamed('skip'),
            search: anyNamed('search'),
            filters: anyNamed('filters'),
            productFilters: anyNamed('productFilters'),
          )).thenAnswer((_) async => Right(sampleProductList));
          return productListBloc;
        },
        act: (bloc) => bloc.add(const RetryLoad()),
        expect: () => [
          const ProductListState.loading(),
          ProductListState.success(
            productList: sampleProductList,
            isOffline: false,
          ),
        ],
      );
    });
  });
}