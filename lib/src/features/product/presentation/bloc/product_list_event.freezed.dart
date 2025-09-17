// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_list_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int limit, int skip, String? search,
            Map<String, String>? filters, ProductFilters? productFilters)
        loadProducts,
    required TResult Function() loadMoreProducts,
    required TResult Function(String query, ProductFilters? additionalFilters)
        searchProducts,
    required TResult Function(
            Map<String, String>? filters, ProductFilters? productFilters)
        filterProducts,
    required TResult Function() refreshProducts,
    required TResult Function() clearFilters,
    required TResult Function() retryLoad,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int limit, int skip, String? search,
            Map<String, String>? filters, ProductFilters? productFilters)?
        loadProducts,
    TResult? Function()? loadMoreProducts,
    TResult? Function(String query, ProductFilters? additionalFilters)?
        searchProducts,
    TResult? Function(
            Map<String, String>? filters, ProductFilters? productFilters)?
        filterProducts,
    TResult? Function()? refreshProducts,
    TResult? Function()? clearFilters,
    TResult? Function()? retryLoad,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int limit, int skip, String? search,
            Map<String, String>? filters, ProductFilters? productFilters)?
        loadProducts,
    TResult Function()? loadMoreProducts,
    TResult Function(String query, ProductFilters? additionalFilters)?
        searchProducts,
    TResult Function(
            Map<String, String>? filters, ProductFilters? productFilters)?
        filterProducts,
    TResult Function()? refreshProducts,
    TResult Function()? clearFilters,
    TResult Function()? retryLoad,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProducts value) loadProducts,
    required TResult Function(LoadMoreProducts value) loadMoreProducts,
    required TResult Function(SearchProducts value) searchProducts,
    required TResult Function(FilterProducts value) filterProducts,
    required TResult Function(RefreshProducts value) refreshProducts,
    required TResult Function(ClearFilters value) clearFilters,
    required TResult Function(RetryLoad value) retryLoad,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProducts value)? loadProducts,
    TResult? Function(LoadMoreProducts value)? loadMoreProducts,
    TResult? Function(SearchProducts value)? searchProducts,
    TResult? Function(FilterProducts value)? filterProducts,
    TResult? Function(RefreshProducts value)? refreshProducts,
    TResult? Function(ClearFilters value)? clearFilters,
    TResult? Function(RetryLoad value)? retryLoad,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProducts value)? loadProducts,
    TResult Function(LoadMoreProducts value)? loadMoreProducts,
    TResult Function(SearchProducts value)? searchProducts,
    TResult Function(FilterProducts value)? filterProducts,
    TResult Function(RefreshProducts value)? refreshProducts,
    TResult Function(ClearFilters value)? clearFilters,
    TResult Function(RetryLoad value)? retryLoad,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductListEventCopyWith<$Res> {
  factory $ProductListEventCopyWith(
          ProductListEvent value, $Res Function(ProductListEvent) then) =
      _$ProductListEventCopyWithImpl<$Res, ProductListEvent>;
}

/// @nodoc
class _$ProductListEventCopyWithImpl<$Res, $Val extends ProductListEvent>
    implements $ProductListEventCopyWith<$Res> {
  _$ProductListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadProductsImplCopyWith<$Res> {
  factory _$$LoadProductsImplCopyWith(
          _$LoadProductsImpl value, $Res Function(_$LoadProductsImpl) then) =
      __$$LoadProductsImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int limit,
      int skip,
      String? search,
      Map<String, String>? filters,
      ProductFilters? productFilters});

  $ProductFiltersCopyWith<$Res>? get productFilters;
}

/// @nodoc
class __$$LoadProductsImplCopyWithImpl<$Res>
    extends _$ProductListEventCopyWithImpl<$Res, _$LoadProductsImpl>
    implements _$$LoadProductsImplCopyWith<$Res> {
  __$$LoadProductsImplCopyWithImpl(
      _$LoadProductsImpl _value, $Res Function(_$LoadProductsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? skip = null,
    Object? search = freezed,
    Object? filters = freezed,
    Object? productFilters = freezed,
  }) {
    return _then(_$LoadProductsImpl(
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
      productFilters: freezed == productFilters
          ? _value.productFilters
          : productFilters // ignore: cast_nullable_to_non_nullable
              as ProductFilters?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductFiltersCopyWith<$Res>? get productFilters {
    if (_value.productFilters == null) {
      return null;
    }

    return $ProductFiltersCopyWith<$Res>(_value.productFilters!, (value) {
      return _then(_value.copyWith(productFilters: value));
    });
  }
}

/// @nodoc

class _$LoadProductsImpl implements LoadProducts {
  const _$LoadProductsImpl(
      {this.limit = 20,
      this.skip = 0,
      this.search,
      final Map<String, String>? filters,
      this.productFilters})
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
  final ProductFilters? productFilters;

  @override
  String toString() {
    return 'ProductListEvent.loadProducts(limit: $limit, skip: $skip, search: $search, filters: $filters, productFilters: $productFilters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadProductsImpl &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.skip, skip) || other.skip == skip) &&
            (identical(other.search, search) || other.search == search) &&
            const DeepCollectionEquality().equals(other._filters, _filters) &&
            (identical(other.productFilters, productFilters) ||
                other.productFilters == productFilters));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limit, skip, search,
      const DeepCollectionEquality().hash(_filters), productFilters);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadProductsImplCopyWith<_$LoadProductsImpl> get copyWith =>
      __$$LoadProductsImplCopyWithImpl<_$LoadProductsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int limit, int skip, String? search,
            Map<String, String>? filters, ProductFilters? productFilters)
        loadProducts,
    required TResult Function() loadMoreProducts,
    required TResult Function(String query, ProductFilters? additionalFilters)
        searchProducts,
    required TResult Function(
            Map<String, String>? filters, ProductFilters? productFilters)
        filterProducts,
    required TResult Function() refreshProducts,
    required TResult Function() clearFilters,
    required TResult Function() retryLoad,
  }) {
    return loadProducts(limit, skip, search, filters, productFilters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int limit, int skip, String? search,
            Map<String, String>? filters, ProductFilters? productFilters)?
        loadProducts,
    TResult? Function()? loadMoreProducts,
    TResult? Function(String query, ProductFilters? additionalFilters)?
        searchProducts,
    TResult? Function(
            Map<String, String>? filters, ProductFilters? productFilters)?
        filterProducts,
    TResult? Function()? refreshProducts,
    TResult? Function()? clearFilters,
    TResult? Function()? retryLoad,
  }) {
    return loadProducts?.call(limit, skip, search, filters, productFilters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int limit, int skip, String? search,
            Map<String, String>? filters, ProductFilters? productFilters)?
        loadProducts,
    TResult Function()? loadMoreProducts,
    TResult Function(String query, ProductFilters? additionalFilters)?
        searchProducts,
    TResult Function(
            Map<String, String>? filters, ProductFilters? productFilters)?
        filterProducts,
    TResult Function()? refreshProducts,
    TResult Function()? clearFilters,
    TResult Function()? retryLoad,
    required TResult orElse(),
  }) {
    if (loadProducts != null) {
      return loadProducts(limit, skip, search, filters, productFilters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProducts value) loadProducts,
    required TResult Function(LoadMoreProducts value) loadMoreProducts,
    required TResult Function(SearchProducts value) searchProducts,
    required TResult Function(FilterProducts value) filterProducts,
    required TResult Function(RefreshProducts value) refreshProducts,
    required TResult Function(ClearFilters value) clearFilters,
    required TResult Function(RetryLoad value) retryLoad,
  }) {
    return loadProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProducts value)? loadProducts,
    TResult? Function(LoadMoreProducts value)? loadMoreProducts,
    TResult? Function(SearchProducts value)? searchProducts,
    TResult? Function(FilterProducts value)? filterProducts,
    TResult? Function(RefreshProducts value)? refreshProducts,
    TResult? Function(ClearFilters value)? clearFilters,
    TResult? Function(RetryLoad value)? retryLoad,
  }) {
    return loadProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProducts value)? loadProducts,
    TResult Function(LoadMoreProducts value)? loadMoreProducts,
    TResult Function(SearchProducts value)? searchProducts,
    TResult Function(FilterProducts value)? filterProducts,
    TResult Function(RefreshProducts value)? refreshProducts,
    TResult Function(ClearFilters value)? clearFilters,
    TResult Function(RetryLoad value)? retryLoad,
    required TResult orElse(),
  }) {
    if (loadProducts != null) {
      return loadProducts(this);
    }
    return orElse();
  }
}

abstract class LoadProducts implements ProductListEvent {
  const factory LoadProducts(
      {final int limit,
      final int skip,
      final String? search,
      final Map<String, String>? filters,
      final ProductFilters? productFilters}) = _$LoadProductsImpl;

  int get limit;
  int get skip;
  String? get search;
  Map<String, String>? get filters;
  ProductFilters? get productFilters;
  @JsonKey(ignore: true)
  _$$LoadProductsImplCopyWith<_$LoadProductsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreProductsImplCopyWith<$Res> {
  factory _$$LoadMoreProductsImplCopyWith(_$LoadMoreProductsImpl value,
          $Res Function(_$LoadMoreProductsImpl) then) =
      __$$LoadMoreProductsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMoreProductsImplCopyWithImpl<$Res>
    extends _$ProductListEventCopyWithImpl<$Res, _$LoadMoreProductsImpl>
    implements _$$LoadMoreProductsImplCopyWith<$Res> {
  __$$LoadMoreProductsImplCopyWithImpl(_$LoadMoreProductsImpl _value,
      $Res Function(_$LoadMoreProductsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadMoreProductsImpl implements LoadMoreProducts {
  const _$LoadMoreProductsImpl();

  @override
  String toString() {
    return 'ProductListEvent.loadMoreProducts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadMoreProductsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int limit, int skip, String? search,
            Map<String, String>? filters, ProductFilters? productFilters)
        loadProducts,
    required TResult Function() loadMoreProducts,
    required TResult Function(String query, ProductFilters? additionalFilters)
        searchProducts,
    required TResult Function(
            Map<String, String>? filters, ProductFilters? productFilters)
        filterProducts,
    required TResult Function() refreshProducts,
    required TResult Function() clearFilters,
    required TResult Function() retryLoad,
  }) {
    return loadMoreProducts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int limit, int skip, String? search,
            Map<String, String>? filters, ProductFilters? productFilters)?
        loadProducts,
    TResult? Function()? loadMoreProducts,
    TResult? Function(String query, ProductFilters? additionalFilters)?
        searchProducts,
    TResult? Function(
            Map<String, String>? filters, ProductFilters? productFilters)?
        filterProducts,
    TResult? Function()? refreshProducts,
    TResult? Function()? clearFilters,
    TResult? Function()? retryLoad,
  }) {
    return loadMoreProducts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int limit, int skip, String? search,
            Map<String, String>? filters, ProductFilters? productFilters)?
        loadProducts,
    TResult Function()? loadMoreProducts,
    TResult Function(String query, ProductFilters? additionalFilters)?
        searchProducts,
    TResult Function(
            Map<String, String>? filters, ProductFilters? productFilters)?
        filterProducts,
    TResult Function()? refreshProducts,
    TResult Function()? clearFilters,
    TResult Function()? retryLoad,
    required TResult orElse(),
  }) {
    if (loadMoreProducts != null) {
      return loadMoreProducts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProducts value) loadProducts,
    required TResult Function(LoadMoreProducts value) loadMoreProducts,
    required TResult Function(SearchProducts value) searchProducts,
    required TResult Function(FilterProducts value) filterProducts,
    required TResult Function(RefreshProducts value) refreshProducts,
    required TResult Function(ClearFilters value) clearFilters,
    required TResult Function(RetryLoad value) retryLoad,
  }) {
    return loadMoreProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProducts value)? loadProducts,
    TResult? Function(LoadMoreProducts value)? loadMoreProducts,
    TResult? Function(SearchProducts value)? searchProducts,
    TResult? Function(FilterProducts value)? filterProducts,
    TResult? Function(RefreshProducts value)? refreshProducts,
    TResult? Function(ClearFilters value)? clearFilters,
    TResult? Function(RetryLoad value)? retryLoad,
  }) {
    return loadMoreProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProducts value)? loadProducts,
    TResult Function(LoadMoreProducts value)? loadMoreProducts,
    TResult Function(SearchProducts value)? searchProducts,
    TResult Function(FilterProducts value)? filterProducts,
    TResult Function(RefreshProducts value)? refreshProducts,
    TResult Function(ClearFilters value)? clearFilters,
    TResult Function(RetryLoad value)? retryLoad,
    required TResult orElse(),
  }) {
    if (loadMoreProducts != null) {
      return loadMoreProducts(this);
    }
    return orElse();
  }
}

abstract class LoadMoreProducts implements ProductListEvent {
  const factory LoadMoreProducts() = _$LoadMoreProductsImpl;
}

/// @nodoc
abstract class _$$SearchProductsImplCopyWith<$Res> {
  factory _$$SearchProductsImplCopyWith(_$SearchProductsImpl value,
          $Res Function(_$SearchProductsImpl) then) =
      __$$SearchProductsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query, ProductFilters? additionalFilters});

  $ProductFiltersCopyWith<$Res>? get additionalFilters;
}

/// @nodoc
class __$$SearchProductsImplCopyWithImpl<$Res>
    extends _$ProductListEventCopyWithImpl<$Res, _$SearchProductsImpl>
    implements _$$SearchProductsImplCopyWith<$Res> {
  __$$SearchProductsImplCopyWithImpl(
      _$SearchProductsImpl _value, $Res Function(_$SearchProductsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? additionalFilters = freezed,
  }) {
    return _then(_$SearchProductsImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      additionalFilters: freezed == additionalFilters
          ? _value.additionalFilters
          : additionalFilters // ignore: cast_nullable_to_non_nullable
              as ProductFilters?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductFiltersCopyWith<$Res>? get additionalFilters {
    if (_value.additionalFilters == null) {
      return null;
    }

    return $ProductFiltersCopyWith<$Res>(_value.additionalFilters!, (value) {
      return _then(_value.copyWith(additionalFilters: value));
    });
  }
}

/// @nodoc

class _$SearchProductsImpl implements SearchProducts {
  const _$SearchProductsImpl({required this.query, this.additionalFilters});

  @override
  final String query;
  @override
  final ProductFilters? additionalFilters;

  @override
  String toString() {
    return 'ProductListEvent.searchProducts(query: $query, additionalFilters: $additionalFilters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchProductsImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.additionalFilters, additionalFilters) ||
                other.additionalFilters == additionalFilters));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, additionalFilters);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchProductsImplCopyWith<_$SearchProductsImpl> get copyWith =>
      __$$SearchProductsImplCopyWithImpl<_$SearchProductsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int limit, int skip, String? search,
            Map<String, String>? filters, ProductFilters? productFilters)
        loadProducts,
    required TResult Function() loadMoreProducts,
    required TResult Function(String query, ProductFilters? additionalFilters)
        searchProducts,
    required TResult Function(
            Map<String, String>? filters, ProductFilters? productFilters)
        filterProducts,
    required TResult Function() refreshProducts,
    required TResult Function() clearFilters,
    required TResult Function() retryLoad,
  }) {
    return searchProducts(query, additionalFilters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int limit, int skip, String? search,
            Map<String, String>? filters, ProductFilters? productFilters)?
        loadProducts,
    TResult? Function()? loadMoreProducts,
    TResult? Function(String query, ProductFilters? additionalFilters)?
        searchProducts,
    TResult? Function(
            Map<String, String>? filters, ProductFilters? productFilters)?
        filterProducts,
    TResult? Function()? refreshProducts,
    TResult? Function()? clearFilters,
    TResult? Function()? retryLoad,
  }) {
    return searchProducts?.call(query, additionalFilters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int limit, int skip, String? search,
            Map<String, String>? filters, ProductFilters? productFilters)?
        loadProducts,
    TResult Function()? loadMoreProducts,
    TResult Function(String query, ProductFilters? additionalFilters)?
        searchProducts,
    TResult Function(
            Map<String, String>? filters, ProductFilters? productFilters)?
        filterProducts,
    TResult Function()? refreshProducts,
    TResult Function()? clearFilters,
    TResult Function()? retryLoad,
    required TResult orElse(),
  }) {
    if (searchProducts != null) {
      return searchProducts(query, additionalFilters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProducts value) loadProducts,
    required TResult Function(LoadMoreProducts value) loadMoreProducts,
    required TResult Function(SearchProducts value) searchProducts,
    required TResult Function(FilterProducts value) filterProducts,
    required TResult Function(RefreshProducts value) refreshProducts,
    required TResult Function(ClearFilters value) clearFilters,
    required TResult Function(RetryLoad value) retryLoad,
  }) {
    return searchProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProducts value)? loadProducts,
    TResult? Function(LoadMoreProducts value)? loadMoreProducts,
    TResult? Function(SearchProducts value)? searchProducts,
    TResult? Function(FilterProducts value)? filterProducts,
    TResult? Function(RefreshProducts value)? refreshProducts,
    TResult? Function(ClearFilters value)? clearFilters,
    TResult? Function(RetryLoad value)? retryLoad,
  }) {
    return searchProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProducts value)? loadProducts,
    TResult Function(LoadMoreProducts value)? loadMoreProducts,
    TResult Function(SearchProducts value)? searchProducts,
    TResult Function(FilterProducts value)? filterProducts,
    TResult Function(RefreshProducts value)? refreshProducts,
    TResult Function(ClearFilters value)? clearFilters,
    TResult Function(RetryLoad value)? retryLoad,
    required TResult orElse(),
  }) {
    if (searchProducts != null) {
      return searchProducts(this);
    }
    return orElse();
  }
}

abstract class SearchProducts implements ProductListEvent {
  const factory SearchProducts(
      {required final String query,
      final ProductFilters? additionalFilters}) = _$SearchProductsImpl;

  String get query;
  ProductFilters? get additionalFilters;
  @JsonKey(ignore: true)
  _$$SearchProductsImplCopyWith<_$SearchProductsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterProductsImplCopyWith<$Res> {
  factory _$$FilterProductsImplCopyWith(_$FilterProductsImpl value,
          $Res Function(_$FilterProductsImpl) then) =
      __$$FilterProductsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, String>? filters, ProductFilters? productFilters});

  $ProductFiltersCopyWith<$Res>? get productFilters;
}

/// @nodoc
class __$$FilterProductsImplCopyWithImpl<$Res>
    extends _$ProductListEventCopyWithImpl<$Res, _$FilterProductsImpl>
    implements _$$FilterProductsImplCopyWith<$Res> {
  __$$FilterProductsImplCopyWithImpl(
      _$FilterProductsImpl _value, $Res Function(_$FilterProductsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filters = freezed,
    Object? productFilters = freezed,
  }) {
    return _then(_$FilterProductsImpl(
      filters: freezed == filters
          ? _value._filters
          : filters // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      productFilters: freezed == productFilters
          ? _value.productFilters
          : productFilters // ignore: cast_nullable_to_non_nullable
              as ProductFilters?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductFiltersCopyWith<$Res>? get productFilters {
    if (_value.productFilters == null) {
      return null;
    }

    return $ProductFiltersCopyWith<$Res>(_value.productFilters!, (value) {
      return _then(_value.copyWith(productFilters: value));
    });
  }
}

/// @nodoc

class _$FilterProductsImpl implements FilterProducts {
  const _$FilterProductsImpl(
      {final Map<String, String>? filters, this.productFilters})
      : _filters = filters;

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
  final ProductFilters? productFilters;

  @override
  String toString() {
    return 'ProductListEvent.filterProducts(filters: $filters, productFilters: $productFilters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterProductsImpl &&
            const DeepCollectionEquality().equals(other._filters, _filters) &&
            (identical(other.productFilters, productFilters) ||
                other.productFilters == productFilters));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_filters), productFilters);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterProductsImplCopyWith<_$FilterProductsImpl> get copyWith =>
      __$$FilterProductsImplCopyWithImpl<_$FilterProductsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int limit, int skip, String? search,
            Map<String, String>? filters, ProductFilters? productFilters)
        loadProducts,
    required TResult Function() loadMoreProducts,
    required TResult Function(String query, ProductFilters? additionalFilters)
        searchProducts,
    required TResult Function(
            Map<String, String>? filters, ProductFilters? productFilters)
        filterProducts,
    required TResult Function() refreshProducts,
    required TResult Function() clearFilters,
    required TResult Function() retryLoad,
  }) {
    return filterProducts(filters, productFilters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int limit, int skip, String? search,
            Map<String, String>? filters, ProductFilters? productFilters)?
        loadProducts,
    TResult? Function()? loadMoreProducts,
    TResult? Function(String query, ProductFilters? additionalFilters)?
        searchProducts,
    TResult? Function(
            Map<String, String>? filters, ProductFilters? productFilters)?
        filterProducts,
    TResult? Function()? refreshProducts,
    TResult? Function()? clearFilters,
    TResult? Function()? retryLoad,
  }) {
    return filterProducts?.call(filters, productFilters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int limit, int skip, String? search,
            Map<String, String>? filters, ProductFilters? productFilters)?
        loadProducts,
    TResult Function()? loadMoreProducts,
    TResult Function(String query, ProductFilters? additionalFilters)?
        searchProducts,
    TResult Function(
            Map<String, String>? filters, ProductFilters? productFilters)?
        filterProducts,
    TResult Function()? refreshProducts,
    TResult Function()? clearFilters,
    TResult Function()? retryLoad,
    required TResult orElse(),
  }) {
    if (filterProducts != null) {
      return filterProducts(filters, productFilters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProducts value) loadProducts,
    required TResult Function(LoadMoreProducts value) loadMoreProducts,
    required TResult Function(SearchProducts value) searchProducts,
    required TResult Function(FilterProducts value) filterProducts,
    required TResult Function(RefreshProducts value) refreshProducts,
    required TResult Function(ClearFilters value) clearFilters,
    required TResult Function(RetryLoad value) retryLoad,
  }) {
    return filterProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProducts value)? loadProducts,
    TResult? Function(LoadMoreProducts value)? loadMoreProducts,
    TResult? Function(SearchProducts value)? searchProducts,
    TResult? Function(FilterProducts value)? filterProducts,
    TResult? Function(RefreshProducts value)? refreshProducts,
    TResult? Function(ClearFilters value)? clearFilters,
    TResult? Function(RetryLoad value)? retryLoad,
  }) {
    return filterProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProducts value)? loadProducts,
    TResult Function(LoadMoreProducts value)? loadMoreProducts,
    TResult Function(SearchProducts value)? searchProducts,
    TResult Function(FilterProducts value)? filterProducts,
    TResult Function(RefreshProducts value)? refreshProducts,
    TResult Function(ClearFilters value)? clearFilters,
    TResult Function(RetryLoad value)? retryLoad,
    required TResult orElse(),
  }) {
    if (filterProducts != null) {
      return filterProducts(this);
    }
    return orElse();
  }
}

abstract class FilterProducts implements ProductListEvent {
  const factory FilterProducts(
      {final Map<String, String>? filters,
      final ProductFilters? productFilters}) = _$FilterProductsImpl;

  Map<String, String>? get filters;
  ProductFilters? get productFilters;
  @JsonKey(ignore: true)
  _$$FilterProductsImplCopyWith<_$FilterProductsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshProductsImplCopyWith<$Res> {
  factory _$$RefreshProductsImplCopyWith(_$RefreshProductsImpl value,
          $Res Function(_$RefreshProductsImpl) then) =
      __$$RefreshProductsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshProductsImplCopyWithImpl<$Res>
    extends _$ProductListEventCopyWithImpl<$Res, _$RefreshProductsImpl>
    implements _$$RefreshProductsImplCopyWith<$Res> {
  __$$RefreshProductsImplCopyWithImpl(
      _$RefreshProductsImpl _value, $Res Function(_$RefreshProductsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RefreshProductsImpl implements RefreshProducts {
  const _$RefreshProductsImpl();

  @override
  String toString() {
    return 'ProductListEvent.refreshProducts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshProductsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int limit, int skip, String? search,
            Map<String, String>? filters, ProductFilters? productFilters)
        loadProducts,
    required TResult Function() loadMoreProducts,
    required TResult Function(String query, ProductFilters? additionalFilters)
        searchProducts,
    required TResult Function(
            Map<String, String>? filters, ProductFilters? productFilters)
        filterProducts,
    required TResult Function() refreshProducts,
    required TResult Function() clearFilters,
    required TResult Function() retryLoad,
  }) {
    return refreshProducts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int limit, int skip, String? search,
            Map<String, String>? filters, ProductFilters? productFilters)?
        loadProducts,
    TResult? Function()? loadMoreProducts,
    TResult? Function(String query, ProductFilters? additionalFilters)?
        searchProducts,
    TResult? Function(
            Map<String, String>? filters, ProductFilters? productFilters)?
        filterProducts,
    TResult? Function()? refreshProducts,
    TResult? Function()? clearFilters,
    TResult? Function()? retryLoad,
  }) {
    return refreshProducts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int limit, int skip, String? search,
            Map<String, String>? filters, ProductFilters? productFilters)?
        loadProducts,
    TResult Function()? loadMoreProducts,
    TResult Function(String query, ProductFilters? additionalFilters)?
        searchProducts,
    TResult Function(
            Map<String, String>? filters, ProductFilters? productFilters)?
        filterProducts,
    TResult Function()? refreshProducts,
    TResult Function()? clearFilters,
    TResult Function()? retryLoad,
    required TResult orElse(),
  }) {
    if (refreshProducts != null) {
      return refreshProducts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProducts value) loadProducts,
    required TResult Function(LoadMoreProducts value) loadMoreProducts,
    required TResult Function(SearchProducts value) searchProducts,
    required TResult Function(FilterProducts value) filterProducts,
    required TResult Function(RefreshProducts value) refreshProducts,
    required TResult Function(ClearFilters value) clearFilters,
    required TResult Function(RetryLoad value) retryLoad,
  }) {
    return refreshProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProducts value)? loadProducts,
    TResult? Function(LoadMoreProducts value)? loadMoreProducts,
    TResult? Function(SearchProducts value)? searchProducts,
    TResult? Function(FilterProducts value)? filterProducts,
    TResult? Function(RefreshProducts value)? refreshProducts,
    TResult? Function(ClearFilters value)? clearFilters,
    TResult? Function(RetryLoad value)? retryLoad,
  }) {
    return refreshProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProducts value)? loadProducts,
    TResult Function(LoadMoreProducts value)? loadMoreProducts,
    TResult Function(SearchProducts value)? searchProducts,
    TResult Function(FilterProducts value)? filterProducts,
    TResult Function(RefreshProducts value)? refreshProducts,
    TResult Function(ClearFilters value)? clearFilters,
    TResult Function(RetryLoad value)? retryLoad,
    required TResult orElse(),
  }) {
    if (refreshProducts != null) {
      return refreshProducts(this);
    }
    return orElse();
  }
}

abstract class RefreshProducts implements ProductListEvent {
  const factory RefreshProducts() = _$RefreshProductsImpl;
}

/// @nodoc
abstract class _$$ClearFiltersImplCopyWith<$Res> {
  factory _$$ClearFiltersImplCopyWith(
          _$ClearFiltersImpl value, $Res Function(_$ClearFiltersImpl) then) =
      __$$ClearFiltersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearFiltersImplCopyWithImpl<$Res>
    extends _$ProductListEventCopyWithImpl<$Res, _$ClearFiltersImpl>
    implements _$$ClearFiltersImplCopyWith<$Res> {
  __$$ClearFiltersImplCopyWithImpl(
      _$ClearFiltersImpl _value, $Res Function(_$ClearFiltersImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearFiltersImpl implements ClearFilters {
  const _$ClearFiltersImpl();

  @override
  String toString() {
    return 'ProductListEvent.clearFilters()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearFiltersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int limit, int skip, String? search,
            Map<String, String>? filters, ProductFilters? productFilters)
        loadProducts,
    required TResult Function() loadMoreProducts,
    required TResult Function(String query, ProductFilters? additionalFilters)
        searchProducts,
    required TResult Function(
            Map<String, String>? filters, ProductFilters? productFilters)
        filterProducts,
    required TResult Function() refreshProducts,
    required TResult Function() clearFilters,
    required TResult Function() retryLoad,
  }) {
    return clearFilters();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int limit, int skip, String? search,
            Map<String, String>? filters, ProductFilters? productFilters)?
        loadProducts,
    TResult? Function()? loadMoreProducts,
    TResult? Function(String query, ProductFilters? additionalFilters)?
        searchProducts,
    TResult? Function(
            Map<String, String>? filters, ProductFilters? productFilters)?
        filterProducts,
    TResult? Function()? refreshProducts,
    TResult? Function()? clearFilters,
    TResult? Function()? retryLoad,
  }) {
    return clearFilters?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int limit, int skip, String? search,
            Map<String, String>? filters, ProductFilters? productFilters)?
        loadProducts,
    TResult Function()? loadMoreProducts,
    TResult Function(String query, ProductFilters? additionalFilters)?
        searchProducts,
    TResult Function(
            Map<String, String>? filters, ProductFilters? productFilters)?
        filterProducts,
    TResult Function()? refreshProducts,
    TResult Function()? clearFilters,
    TResult Function()? retryLoad,
    required TResult orElse(),
  }) {
    if (clearFilters != null) {
      return clearFilters();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProducts value) loadProducts,
    required TResult Function(LoadMoreProducts value) loadMoreProducts,
    required TResult Function(SearchProducts value) searchProducts,
    required TResult Function(FilterProducts value) filterProducts,
    required TResult Function(RefreshProducts value) refreshProducts,
    required TResult Function(ClearFilters value) clearFilters,
    required TResult Function(RetryLoad value) retryLoad,
  }) {
    return clearFilters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProducts value)? loadProducts,
    TResult? Function(LoadMoreProducts value)? loadMoreProducts,
    TResult? Function(SearchProducts value)? searchProducts,
    TResult? Function(FilterProducts value)? filterProducts,
    TResult? Function(RefreshProducts value)? refreshProducts,
    TResult? Function(ClearFilters value)? clearFilters,
    TResult? Function(RetryLoad value)? retryLoad,
  }) {
    return clearFilters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProducts value)? loadProducts,
    TResult Function(LoadMoreProducts value)? loadMoreProducts,
    TResult Function(SearchProducts value)? searchProducts,
    TResult Function(FilterProducts value)? filterProducts,
    TResult Function(RefreshProducts value)? refreshProducts,
    TResult Function(ClearFilters value)? clearFilters,
    TResult Function(RetryLoad value)? retryLoad,
    required TResult orElse(),
  }) {
    if (clearFilters != null) {
      return clearFilters(this);
    }
    return orElse();
  }
}

abstract class ClearFilters implements ProductListEvent {
  const factory ClearFilters() = _$ClearFiltersImpl;
}

/// @nodoc
abstract class _$$RetryLoadImplCopyWith<$Res> {
  factory _$$RetryLoadImplCopyWith(
          _$RetryLoadImpl value, $Res Function(_$RetryLoadImpl) then) =
      __$$RetryLoadImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RetryLoadImplCopyWithImpl<$Res>
    extends _$ProductListEventCopyWithImpl<$Res, _$RetryLoadImpl>
    implements _$$RetryLoadImplCopyWith<$Res> {
  __$$RetryLoadImplCopyWithImpl(
      _$RetryLoadImpl _value, $Res Function(_$RetryLoadImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RetryLoadImpl implements RetryLoad {
  const _$RetryLoadImpl();

  @override
  String toString() {
    return 'ProductListEvent.retryLoad()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RetryLoadImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int limit, int skip, String? search,
            Map<String, String>? filters, ProductFilters? productFilters)
        loadProducts,
    required TResult Function() loadMoreProducts,
    required TResult Function(String query, ProductFilters? additionalFilters)
        searchProducts,
    required TResult Function(
            Map<String, String>? filters, ProductFilters? productFilters)
        filterProducts,
    required TResult Function() refreshProducts,
    required TResult Function() clearFilters,
    required TResult Function() retryLoad,
  }) {
    return retryLoad();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int limit, int skip, String? search,
            Map<String, String>? filters, ProductFilters? productFilters)?
        loadProducts,
    TResult? Function()? loadMoreProducts,
    TResult? Function(String query, ProductFilters? additionalFilters)?
        searchProducts,
    TResult? Function(
            Map<String, String>? filters, ProductFilters? productFilters)?
        filterProducts,
    TResult? Function()? refreshProducts,
    TResult? Function()? clearFilters,
    TResult? Function()? retryLoad,
  }) {
    return retryLoad?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int limit, int skip, String? search,
            Map<String, String>? filters, ProductFilters? productFilters)?
        loadProducts,
    TResult Function()? loadMoreProducts,
    TResult Function(String query, ProductFilters? additionalFilters)?
        searchProducts,
    TResult Function(
            Map<String, String>? filters, ProductFilters? productFilters)?
        filterProducts,
    TResult Function()? refreshProducts,
    TResult Function()? clearFilters,
    TResult Function()? retryLoad,
    required TResult orElse(),
  }) {
    if (retryLoad != null) {
      return retryLoad();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProducts value) loadProducts,
    required TResult Function(LoadMoreProducts value) loadMoreProducts,
    required TResult Function(SearchProducts value) searchProducts,
    required TResult Function(FilterProducts value) filterProducts,
    required TResult Function(RefreshProducts value) refreshProducts,
    required TResult Function(ClearFilters value) clearFilters,
    required TResult Function(RetryLoad value) retryLoad,
  }) {
    return retryLoad(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProducts value)? loadProducts,
    TResult? Function(LoadMoreProducts value)? loadMoreProducts,
    TResult? Function(SearchProducts value)? searchProducts,
    TResult? Function(FilterProducts value)? filterProducts,
    TResult? Function(RefreshProducts value)? refreshProducts,
    TResult? Function(ClearFilters value)? clearFilters,
    TResult? Function(RetryLoad value)? retryLoad,
  }) {
    return retryLoad?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProducts value)? loadProducts,
    TResult Function(LoadMoreProducts value)? loadMoreProducts,
    TResult Function(SearchProducts value)? searchProducts,
    TResult Function(FilterProducts value)? filterProducts,
    TResult Function(RefreshProducts value)? refreshProducts,
    TResult Function(ClearFilters value)? clearFilters,
    TResult Function(RetryLoad value)? retryLoad,
    required TResult orElse(),
  }) {
    if (retryLoad != null) {
      return retryLoad(this);
    }
    return orElse();
  }
}

abstract class RetryLoad implements ProductListEvent {
  const factory RetryLoad() = _$RetryLoadImpl;
}
