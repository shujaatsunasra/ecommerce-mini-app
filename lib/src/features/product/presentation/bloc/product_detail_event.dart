import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_detail_event.freezed.dart';

@freezed
class ProductDetailEvent with _$ProductDetailEvent {
  const factory ProductDetailEvent.loadProductDetail({
    required int productId,
  }) = LoadProductDetail;

  const factory ProductDetailEvent.refreshProductDetail() = RefreshProductDetail;

  const factory ProductDetailEvent.retryLoadProductDetail({
    required int productId,
  }) = RetryLoadProductDetail;
}
