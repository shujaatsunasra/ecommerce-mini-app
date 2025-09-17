// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductDetailState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Product product, bool isOffline) success,
    required TResult Function(String message, bool isOffline) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Product product, bool isOffline)? success,
    TResult? Function(String message, bool isOffline)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Product product, bool isOffline)? success,
    TResult Function(String message, bool isOffline)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductDetailInitial value) initial,
    required TResult Function(ProductDetailLoading value) loading,
    required TResult Function(ProductDetailSuccess value) success,
    required TResult Function(ProductDetailError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductDetailInitial value)? initial,
    TResult? Function(ProductDetailLoading value)? loading,
    TResult? Function(ProductDetailSuccess value)? success,
    TResult? Function(ProductDetailError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductDetailInitial value)? initial,
    TResult Function(ProductDetailLoading value)? loading,
    TResult Function(ProductDetailSuccess value)? success,
    TResult Function(ProductDetailError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailStateCopyWith<$Res> {
  factory $ProductDetailStateCopyWith(
          ProductDetailState value, $Res Function(ProductDetailState) then) =
      _$ProductDetailStateCopyWithImpl<$Res, ProductDetailState>;
}

/// @nodoc
class _$ProductDetailStateCopyWithImpl<$Res, $Val extends ProductDetailState>
    implements $ProductDetailStateCopyWith<$Res> {
  _$ProductDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ProductDetailInitialImplCopyWith<$Res> {
  factory _$$ProductDetailInitialImplCopyWith(_$ProductDetailInitialImpl value,
          $Res Function(_$ProductDetailInitialImpl) then) =
      __$$ProductDetailInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProductDetailInitialImplCopyWithImpl<$Res>
    extends _$ProductDetailStateCopyWithImpl<$Res, _$ProductDetailInitialImpl>
    implements _$$ProductDetailInitialImplCopyWith<$Res> {
  __$$ProductDetailInitialImplCopyWithImpl(_$ProductDetailInitialImpl _value,
      $Res Function(_$ProductDetailInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProductDetailInitialImpl implements ProductDetailInitial {
  const _$ProductDetailInitialImpl();

  @override
  String toString() {
    return 'ProductDetailState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDetailInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Product product, bool isOffline) success,
    required TResult Function(String message, bool isOffline) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Product product, bool isOffline)? success,
    TResult? Function(String message, bool isOffline)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Product product, bool isOffline)? success,
    TResult Function(String message, bool isOffline)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductDetailInitial value) initial,
    required TResult Function(ProductDetailLoading value) loading,
    required TResult Function(ProductDetailSuccess value) success,
    required TResult Function(ProductDetailError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductDetailInitial value)? initial,
    TResult? Function(ProductDetailLoading value)? loading,
    TResult? Function(ProductDetailSuccess value)? success,
    TResult? Function(ProductDetailError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductDetailInitial value)? initial,
    TResult Function(ProductDetailLoading value)? loading,
    TResult Function(ProductDetailSuccess value)? success,
    TResult Function(ProductDetailError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ProductDetailInitial implements ProductDetailState {
  const factory ProductDetailInitial() = _$ProductDetailInitialImpl;
}

/// @nodoc
abstract class _$$ProductDetailLoadingImplCopyWith<$Res> {
  factory _$$ProductDetailLoadingImplCopyWith(_$ProductDetailLoadingImpl value,
          $Res Function(_$ProductDetailLoadingImpl) then) =
      __$$ProductDetailLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProductDetailLoadingImplCopyWithImpl<$Res>
    extends _$ProductDetailStateCopyWithImpl<$Res, _$ProductDetailLoadingImpl>
    implements _$$ProductDetailLoadingImplCopyWith<$Res> {
  __$$ProductDetailLoadingImplCopyWithImpl(_$ProductDetailLoadingImpl _value,
      $Res Function(_$ProductDetailLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProductDetailLoadingImpl implements ProductDetailLoading {
  const _$ProductDetailLoadingImpl();

  @override
  String toString() {
    return 'ProductDetailState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDetailLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Product product, bool isOffline) success,
    required TResult Function(String message, bool isOffline) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Product product, bool isOffline)? success,
    TResult? Function(String message, bool isOffline)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Product product, bool isOffline)? success,
    TResult Function(String message, bool isOffline)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductDetailInitial value) initial,
    required TResult Function(ProductDetailLoading value) loading,
    required TResult Function(ProductDetailSuccess value) success,
    required TResult Function(ProductDetailError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductDetailInitial value)? initial,
    TResult? Function(ProductDetailLoading value)? loading,
    TResult? Function(ProductDetailSuccess value)? success,
    TResult? Function(ProductDetailError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductDetailInitial value)? initial,
    TResult Function(ProductDetailLoading value)? loading,
    TResult Function(ProductDetailSuccess value)? success,
    TResult Function(ProductDetailError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ProductDetailLoading implements ProductDetailState {
  const factory ProductDetailLoading() = _$ProductDetailLoadingImpl;
}

/// @nodoc
abstract class _$$ProductDetailSuccessImplCopyWith<$Res> {
  factory _$$ProductDetailSuccessImplCopyWith(_$ProductDetailSuccessImpl value,
          $Res Function(_$ProductDetailSuccessImpl) then) =
      __$$ProductDetailSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Product product, bool isOffline});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$ProductDetailSuccessImplCopyWithImpl<$Res>
    extends _$ProductDetailStateCopyWithImpl<$Res, _$ProductDetailSuccessImpl>
    implements _$$ProductDetailSuccessImplCopyWith<$Res> {
  __$$ProductDetailSuccessImplCopyWithImpl(_$ProductDetailSuccessImpl _value,
      $Res Function(_$ProductDetailSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? isOffline = null,
  }) {
    return _then(_$ProductDetailSuccessImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      isOffline: null == isOffline
          ? _value.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc

class _$ProductDetailSuccessImpl implements ProductDetailSuccess {
  const _$ProductDetailSuccessImpl(
      {required this.product, this.isOffline = false});

  @override
  final Product product;
  @override
  @JsonKey()
  final bool isOffline;

  @override
  String toString() {
    return 'ProductDetailState.success(product: $product, isOffline: $isOffline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDetailSuccessImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.isOffline, isOffline) ||
                other.isOffline == isOffline));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product, isOffline);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDetailSuccessImplCopyWith<_$ProductDetailSuccessImpl>
      get copyWith =>
          __$$ProductDetailSuccessImplCopyWithImpl<_$ProductDetailSuccessImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Product product, bool isOffline) success,
    required TResult Function(String message, bool isOffline) error,
  }) {
    return success(product, isOffline);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Product product, bool isOffline)? success,
    TResult? Function(String message, bool isOffline)? error,
  }) {
    return success?.call(product, isOffline);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Product product, bool isOffline)? success,
    TResult Function(String message, bool isOffline)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(product, isOffline);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductDetailInitial value) initial,
    required TResult Function(ProductDetailLoading value) loading,
    required TResult Function(ProductDetailSuccess value) success,
    required TResult Function(ProductDetailError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductDetailInitial value)? initial,
    TResult? Function(ProductDetailLoading value)? loading,
    TResult? Function(ProductDetailSuccess value)? success,
    TResult? Function(ProductDetailError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductDetailInitial value)? initial,
    TResult Function(ProductDetailLoading value)? loading,
    TResult Function(ProductDetailSuccess value)? success,
    TResult Function(ProductDetailError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ProductDetailSuccess implements ProductDetailState {
  const factory ProductDetailSuccess(
      {required final Product product,
      final bool isOffline}) = _$ProductDetailSuccessImpl;

  Product get product;
  bool get isOffline;
  @JsonKey(ignore: true)
  _$$ProductDetailSuccessImplCopyWith<_$ProductDetailSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductDetailErrorImplCopyWith<$Res> {
  factory _$$ProductDetailErrorImplCopyWith(_$ProductDetailErrorImpl value,
          $Res Function(_$ProductDetailErrorImpl) then) =
      __$$ProductDetailErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, bool isOffline});
}

/// @nodoc
class __$$ProductDetailErrorImplCopyWithImpl<$Res>
    extends _$ProductDetailStateCopyWithImpl<$Res, _$ProductDetailErrorImpl>
    implements _$$ProductDetailErrorImplCopyWith<$Res> {
  __$$ProductDetailErrorImplCopyWithImpl(_$ProductDetailErrorImpl _value,
      $Res Function(_$ProductDetailErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? isOffline = null,
  }) {
    return _then(_$ProductDetailErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isOffline: null == isOffline
          ? _value.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ProductDetailErrorImpl implements ProductDetailError {
  const _$ProductDetailErrorImpl(
      {required this.message, this.isOffline = false});

  @override
  final String message;
  @override
  @JsonKey()
  final bool isOffline;

  @override
  String toString() {
    return 'ProductDetailState.error(message: $message, isOffline: $isOffline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDetailErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isOffline, isOffline) ||
                other.isOffline == isOffline));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, isOffline);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDetailErrorImplCopyWith<_$ProductDetailErrorImpl> get copyWith =>
      __$$ProductDetailErrorImplCopyWithImpl<_$ProductDetailErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Product product, bool isOffline) success,
    required TResult Function(String message, bool isOffline) error,
  }) {
    return error(message, isOffline);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Product product, bool isOffline)? success,
    TResult? Function(String message, bool isOffline)? error,
  }) {
    return error?.call(message, isOffline);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Product product, bool isOffline)? success,
    TResult Function(String message, bool isOffline)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, isOffline);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProductDetailInitial value) initial,
    required TResult Function(ProductDetailLoading value) loading,
    required TResult Function(ProductDetailSuccess value) success,
    required TResult Function(ProductDetailError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProductDetailInitial value)? initial,
    TResult? Function(ProductDetailLoading value)? loading,
    TResult? Function(ProductDetailSuccess value)? success,
    TResult? Function(ProductDetailError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProductDetailInitial value)? initial,
    TResult Function(ProductDetailLoading value)? loading,
    TResult Function(ProductDetailSuccess value)? success,
    TResult Function(ProductDetailError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ProductDetailError implements ProductDetailState {
  const factory ProductDetailError(
      {required final String message,
      final bool isOffline}) = _$ProductDetailErrorImpl;

  String get message;
  bool get isOffline;
  @JsonKey(ignore: true)
  _$$ProductDetailErrorImplCopyWith<_$ProductDetailErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
