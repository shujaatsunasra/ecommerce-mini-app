// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaginationParams {
  int get limit => throw _privateConstructorUsedError;
  int get skip => throw _privateConstructorUsedError;
  String? get search => throw _privateConstructorUsedError;
  Map<String, String>? get filters => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaginationParamsCopyWith<PaginationParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationParamsCopyWith<$Res> {
  factory $PaginationParamsCopyWith(
          PaginationParams value, $Res Function(PaginationParams) then) =
      _$PaginationParamsCopyWithImpl<$Res, PaginationParams>;
  @useResult
  $Res call(
      {int limit, int skip, String? search, Map<String, String>? filters});
}

/// @nodoc
class _$PaginationParamsCopyWithImpl<$Res, $Val extends PaginationParams>
    implements $PaginationParamsCopyWith<$Res> {
  _$PaginationParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? skip = null,
    Object? search = freezed,
    Object? filters = freezed,
  }) {
    return _then(_value.copyWith(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      skip: null == skip
          ? _value.skip
          : skip // ignore: cast_nullable_to_non_nullable
              as int,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      filters: freezed == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationParamsImplCopyWith<$Res>
    implements $PaginationParamsCopyWith<$Res> {
  factory _$$PaginationParamsImplCopyWith(_$PaginationParamsImpl value,
          $Res Function(_$PaginationParamsImpl) then) =
      __$$PaginationParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int limit, int skip, String? search, Map<String, String>? filters});
}

/// @nodoc
class __$$PaginationParamsImplCopyWithImpl<$Res>
    extends _$PaginationParamsCopyWithImpl<$Res, _$PaginationParamsImpl>
    implements _$$PaginationParamsImplCopyWith<$Res> {
  __$$PaginationParamsImplCopyWithImpl(_$PaginationParamsImpl _value,
      $Res Function(_$PaginationParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? skip = null,
    Object? search = freezed,
    Object? filters = freezed,
  }) {
    return _then(_$PaginationParamsImpl(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      skip: null == skip
          ? _value.skip
          : skip // ignore: cast_nullable_to_non_nullable
              as int,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      filters: freezed == filters
          ? _value._filters
          : filters // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ));
  }
}

/// @nodoc

class _$PaginationParamsImpl implements _PaginationParams {
  const _$PaginationParamsImpl(
      {this.limit = 20,
      this.skip = 0,
      this.search,
      final Map<String, String>? filters})
      : _filters = filters;

  @override
  @JsonKey()
  final int limit;
  @override
  @JsonKey()
  final int skip;
  @override
  final String? search;
  final Map<String, String>? _filters;
  @override
  Map<String, String>? get filters {
    final value = _filters;
    if (value == null) return null;
    if (_filters is EqualUnmodifiableMapView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'PaginationParams(limit: $limit, skip: $skip, search: $search, filters: $filters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationParamsImpl &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.skip, skip) || other.skip == skip) &&
            (identical(other.search, search) || other.search == search) &&
            const DeepCollectionEquality().equals(other._filters, _filters));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limit, skip, search,
      const DeepCollectionEquality().hash(_filters));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationParamsImplCopyWith<_$PaginationParamsImpl> get copyWith =>
      __$$PaginationParamsImplCopyWithImpl<_$PaginationParamsImpl>(
          this, _$identity);
}

abstract class _PaginationParams implements PaginationParams {
  const factory _PaginationParams(
      {final int limit,
      final int skip,
      final String? search,
      final Map<String, String>? filters}) = _$PaginationParamsImpl;

  @override
  int get limit;
  @override
  int get skip;
  @override
  String? get search;
  @override
  Map<String, String>? get filters;
  @override
  @JsonKey(ignore: true)
  _$$PaginationParamsImplCopyWith<_$PaginationParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
