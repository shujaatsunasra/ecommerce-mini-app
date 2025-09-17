import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../domain/repositories/product_repository.dart';
import 'product_detail_event.dart';
import 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final ProductRepository _productRepository;
  final Connectivity _connectivity;

  ProductDetailBloc(this._productRepository, this._connectivity) : super(const ProductDetailState.initial()) {
    on<LoadProductDetail>(_onLoadProductDetail);
    on<RefreshProductDetail>(_onRefreshProductDetail);
    on<RetryLoadProductDetail>(_onRetryLoadProductDetail);
  }

  Future<void> _onLoadProductDetail(LoadProductDetail event, Emitter<ProductDetailState> emit) async {
    emit(const ProductDetailState.loading());

    try {
      final result = await _productRepository.fetchProductDetail(event.productId);

      await result.fold(
        (failure) async {
          final isOffline = !await _isOnline();
          emit(ProductDetailState.error(
            message: _getUserFriendlyErrorMessage(failure),
            isOffline: isOffline,
          ));
        },
        (product) async {
          final isOffline = !await _isOnline();
          emit(ProductDetailState.success(
            product: product,
            isOffline: isOffline,
          ));
        },
      );
    } catch (e) {
      emit(ProductDetailState.error(
        message: 'Oops! Something unexpected happened while loading this product. Our team is on it! 🛠️',
      ));
    }
  }

  Future<void> _onRefreshProductDetail(RefreshProductDetail event, Emitter<ProductDetailState> emit) async {
    final currentState = state;
    
    if (currentState is ProductDetailSuccess) {
      add(LoadProductDetail(productId: currentState.product.id));
    }
  }

  Future<void> _onRetryLoadProductDetail(RetryLoadProductDetail event, Emitter<ProductDetailState> emit) async {
    add(LoadProductDetail(productId: event.productId));
  }

  Future<bool> _isOnline() async {
    final connectivityResults = await _connectivity.checkConnectivity();
    return !connectivityResults.contains(ConnectivityResult.none);
  }

  String _getUserFriendlyErrorMessage(dynamic failure) {
    final message = failure.message?.toString() ?? 'Unknown error';
    
    // Map technical errors to user-friendly messages
    if (message.contains('timeout')) {
      return 'Our servers are taking a coffee break ☕. Try again in a moment!';
    } else if (message.contains('connection')) {
      return 'No internet connection 📡. Check your WiFi and try again!';
    } else if (message.contains('server error')) {
      return 'Our team is fixing this right now 🛠️. Try again soon!';
    } else if (message.contains('not found')) {
      return 'This product seems to have vanished 🪄. It might be out of stock or discontinued!';
    } else if (message.contains('unauthorized')) {
      return 'Please log in again 🔐. Your session expired!';
    } else if (message.contains('forbidden')) {
      return 'You don\'t have permission to view this product 🚫. Contact support if this seems wrong!';
    } else if (message.contains('too many requests')) {
      return 'Slow down there, speed demon! 🏃‍♂️ Try again in a moment!';
    } else {
      return 'Hmm, looks like this product is playing hide and seek 🤔. Try again?';
    }
  }
}
