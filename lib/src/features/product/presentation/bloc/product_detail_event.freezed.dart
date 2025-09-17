// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_detail_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int productId) loadProductDetail,
    required TResult Function() refreshProductDetail,
    required TResult Function(int productId) retryLoadProductDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int productId)? loadProductDetail,
    TResult? Function()? refreshProductDetail,
    TResult? Function(int productId)? retryLoadProductDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int productId)? loadProductDetail,
    TResult Function()? refreshProductDetail,
    TResult Function(int productId)? retryLoadProductDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProductDetail value) loadProductDetail,
    required TResult Function(RefreshProductDetail value) refreshProductDetail,
    required TResult Function(RetryLoadProductDetail value)
        retryLoadProductDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProductDetail value)? loadProductDetail,
    TResult? Function(RefreshProductDetail value)? refreshProductDetail,
    TResult? Function(RetryLoadProductDetail value)? retryLoadProductDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProductDetail value)? loadProductDetail,
    TResult Function(RefreshProductDetail value)? refreshProductDetail,
    TResult Function(RetryLoadProductDetail value)? retryLoadProductDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailEventCopyWith<$Res> {
  factory $ProductDetailEventCopyWith(
          ProductDetailEvent value, $Res Function(ProductDetailEvent) then) =
      _$ProductDetailEventCopyWithImpl<$Res, ProductDetailEvent>;
}

/// @nodoc
class _$ProductDetailEventCopyWithImpl<$Res, $Val extends ProductDetailEvent>
    implements $ProductDetailEventCopyWith<$Res> {
  _$ProductDetailEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadProductDetailImplCopyWith<$Res> {
  factory _$$LoadProductDetailImplCopyWith(_$LoadProductDetailImpl value,
          $Res Function(_$LoadProductDetailImpl) then) =
      __$$LoadProductDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int productId});
}

/// @nodoc
class __$$LoadProductDetailImplCopyWithImpl<$Res>
    extends _$ProductDetailEventCopyWithImpl<$Res, _$LoadProductDetailImpl>
    implements _$$LoadProductDetailImplCopyWith<$Res> {
  __$$LoadProductDetailImplCopyWithImpl(_$LoadProductDetailImpl _value,
      $Res Function(_$LoadProductDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
  }) {
    return _then(_$LoadProductDetailImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadProductDetailImpl implements LoadProductDetail {
  const _$LoadProductDetailImpl({required this.productId});

  @override
  final int productId;

  @override
  String toString() {
    return 'ProductDetailEvent.loadProductDetail(productId: $productId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadProductDetailImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadProductDetailImplCopyWith<_$LoadProductDetailImpl> get copyWith =>
      __$$LoadProductDetailImplCopyWithImpl<_$LoadProductDetailImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int productId) loadProductDetail,
    required TResult Function() refreshProductDetail,
    required TResult Function(int productId) retryLoadProductDetail,
  }) {
    return loadProductDetail(productId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int productId)? loadProductDetail,
    TResult? Function()? refreshProductDetail,
    TResult? Function(int productId)? retryLoadProductDetail,
  }) {
    return loadProductDetail?.call(productId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int productId)? loadProductDetail,
    TResult Function()? refreshProductDetail,
    TResult Function(int productId)? retryLoadProductDetail,
    required TResult orElse(),
  }) {
    if (loadProductDetail != null) {
      return loadProductDetail(productId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProductDetail value) loadProductDetail,
    required TResult Function(RefreshProductDetail value) refreshProductDetail,
    required TResult Function(RetryLoadProductDetail value)
        retryLoadProductDetail,
  }) {
    return loadProductDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProductDetail value)? loadProductDetail,
    TResult? Function(RefreshProductDetail value)? refreshProductDetail,
    TResult? Function(RetryLoadProductDetail value)? retryLoadProductDetail,
  }) {
    return loadProductDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProductDetail value)? loadProductDetail,
    TResult Function(RefreshProductDetail value)? refreshProductDetail,
    TResult Function(RetryLoadProductDetail value)? retryLoadProductDetail,
    required TResult orElse(),
  }) {
    if (loadProductDetail != null) {
      return loadProductDetail(this);
    }
    return orElse();
  }
}

abstract class LoadProductDetail implements ProductDetailEvent {
  const factory LoadProductDetail({required final int productId}) =
      _$LoadProductDetailImpl;

  int get productId;
  @JsonKey(ignore: true)
  _$$LoadProductDetailImplCopyWith<_$LoadProductDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshProductDetailImplCopyWith<$Res> {
  factory _$$RefreshProductDetailImplCopyWith(_$RefreshProductDetailImpl value,
          $Res Function(_$RefreshProductDetailImpl) then) =
      __$$RefreshProductDetailImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshProductDetailImplCopyWithImpl<$Res>
    extends _$ProductDetailEventCopyWithImpl<$Res, _$RefreshProductDetailImpl>
    implements _$$RefreshProductDetailImplCopyWith<$Res> {
  __$$RefreshProductDetailImplCopyWithImpl(_$RefreshProductDetailImpl _value,
      $Res Function(_$RefreshProductDetailImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RefreshProductDetailImpl implements RefreshProductDetail {
  const _$RefreshProductDetailImpl();

  @override
  String toString() {
    return 'ProductDetailEvent.refreshProductDetail()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshProductDetailImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int productId) loadProductDetail,
    required TResult Function() refreshProductDetail,
    required TResult Function(int productId) retryLoadProductDetail,
  }) {
    return refreshProductDetail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int productId)? loadProductDetail,
    TResult? Function()? refreshProductDetail,
    TResult? Function(int productId)? retryLoadProductDetail,
  }) {
    return refreshProductDetail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int productId)? loadProductDetail,
    TResult Function()? refreshProductDetail,
    TResult Function(int productId)? retryLoadProductDetail,
    required TResult orElse(),
  }) {
    if (refreshProductDetail != null) {
      return refreshProductDetail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProductDetail value) loadProductDetail,
    required TResult Function(RefreshProductDetail value) refreshProductDetail,
    required TResult Function(RetryLoadProductDetail value)
        retryLoadProductDetail,
  }) {
    return refreshProductDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProductDetail value)? loadProductDetail,
    TResult? Function(RefreshProductDetail value)? refreshProductDetail,
    TResult? Function(RetryLoadProductDetail value)? retryLoadProductDetail,
  }) {
    return refreshProductDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProductDetail value)? loadProductDetail,
    TResult Function(RefreshProductDetail value)? refreshProductDetail,
    TResult Function(RetryLoadProductDetail value)? retryLoadProductDetail,
    required TResult orElse(),
  }) {
    if (refreshProductDetail != null) {
      return refreshProductDetail(this);
    }
    return orElse();
  }
}

abstract class RefreshProductDetail implements ProductDetailEvent {
  const factory RefreshProductDetail() = _$RefreshProductDetailImpl;
}

/// @nodoc
abstract class _$$RetryLoadProductDetailImplCopyWith<$Res> {
  factory _$$RetryLoadProductDetailImplCopyWith(
          _$RetryLoadProductDetailImpl value,
          $Res Function(_$RetryLoadProductDetailImpl) then) =
      __$$RetryLoadProductDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int productId});
}

/// @nodoc
class __$$RetryLoadProductDetailImplCopyWithImpl<$Res>
    extends _$ProductDetailEventCopyWithImpl<$Res, _$RetryLoadProductDetailImpl>
    implements _$$RetryLoadProductDetailImplCopyWith<$Res> {
  __$$RetryLoadProductDetailImplCopyWithImpl(
      _$RetryLoadProductDetailImpl _value,
      $Res Function(_$RetryLoadProductDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
  }) {
    return _then(_$RetryLoadProductDetailImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RetryLoadProductDetailImpl implements RetryLoadProductDetail {
  const _$RetryLoadProductDetailImpl({required this.productId});

  @override
  final int productId;

  @override
  String toString() {
    return 'ProductDetailEvent.retryLoadProductDetail(productId: $productId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RetryLoadProductDetailImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RetryLoadProductDetailImplCopyWith<_$RetryLoadProductDetailImpl>
      get copyWith => __$$RetryLoadProductDetailImplCopyWithImpl<
          _$RetryLoadProductDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int productId) loadProductDetail,
    required TResult Function() refreshProductDetail,
    required TResult Function(int productId) retryLoadProductDetail,
  }) {
    return retryLoadProductDetail(productId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int productId)? loadProductDetail,
    TResult? Function()? refreshProductDetail,
    TResult? Function(int productId)? retryLoadProductDetail,
  }) {
    return retryLoadProductDetail?.call(productId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int productId)? loadProductDetail,
    TResult Function()? refreshProductDetail,
    TResult Function(int productId)? retryLoadProductDetail,
    required TResult orElse(),
  }) {
    if (retryLoadProductDetail != null) {
      return retryLoadProductDetail(productId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProductDetail value) loadProductDetail,
    required TResult Function(RefreshProductDetail value) refreshProductDetail,
    required TResult Function(RetryLoadProductDetail value)
        retryLoadProductDetail,
  }) {
    return retryLoadProductDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProductDetail value)? loadProductDetail,
    TResult? Function(RefreshProductDetail value)? refreshProductDetail,
    TResult? Function(RetryLoadProductDetail value)? retryLoadProductDetail,
  }) {
    return retryLoadProductDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProductDetail value)? loadProductDetail,
    TResult Function(RefreshProductDetail value)? refreshProductDetail,
    TResult Function(RetryLoadProductDetail value)? retryLoadProductDetail,
    required TResult orElse(),
  }) {
    if (retryLoadProductDetail != null) {
      return retryLoadProductDetail(this);
    }
    return orElse();
  }
}

abstract class RetryLoadProductDetail implements ProductDetailEvent {
  const factory RetryLoadProductDetail({required final int productId}) =
      _$RetryLoadProductDetailImpl;

  int get productId;
  @JsonKey(ignore: true)
  _$$RetryLoadProductDetailImplCopyWith<_$RetryLoadProductDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}
