import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/product.dart';

part 'product_detail_state.freezed.dart';

@freezed
class ProductDetailState with _$ProductDetailState {
  const factory ProductDetailState.initial() = ProductDetailInitial;

  const factory ProductDetailState.loading() = ProductDetailLoading;

  const factory ProductDetailState.success({
    required Product product,
    @Default(false) bool isOffline,
  }) = ProductDetailSuccess;

  const factory ProductDetailState.error({
    required String message,
    @Default(false) bool isOffline,
  }) = ProductDetailError;
}

extension ProductDetailStateExtension on ProductDetailState {
  bool get isLoading => this is ProductDetailLoading;
  
  bool get isSuccess => this is ProductDetailSuccess;
  
  bool get isError => this is ProductDetailError;
  
  Product? get product => when(
    initial: () => null,
    loading: () => null,
    success: (product, isOffline) => product,
    error: (message, isOffline) => null,
  );
  
  String get displayMessage => when(
    initial: () => '',
    loading: () => 'Loading product details...',
    success: (product, isOffline) => isOffline 
        ? 'Showing cached product (offline)'
        : 'Product loaded successfully',
    error: (message, isOffline) => message,
  );
  
  bool get isOffline => when(
    initial: () => false,
    loading: () => false,
    success: (product, isOffline) => isOffline,
    error: (message, isOffline) => isOffline,
  );
}
