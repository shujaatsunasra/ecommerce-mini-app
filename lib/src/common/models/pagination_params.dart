import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_params.freezed.dart';

@freezed
class PaginationParams with _$PaginationParams {
  const factory PaginationParams({
    @Default(20) int limit,
    @Default(0) int skip,
    String? search,
    Map<String, String>? filters,
  }) = _PaginationParams;
}
