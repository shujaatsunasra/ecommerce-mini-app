// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductList {
  List<Product> get products => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get skip => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  bool get isOffline => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;
  Map<String, String> get filters => throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductListCopyWith<ProductList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductListCopyWith<$Res> {
  factory $ProductListCopyWith(
          ProductList value, $Res Function(ProductList) then) =
      _$ProductListCopyWithImpl<$Res, ProductList>;
  @useResult
  $Res call(
      {List<Product> products,
      int total,
      int skip,
      int limit,
      bool hasMore,
      bool isOffline,
      String searchQuery,
      Map<String, String> filters,
      DateTime? lastUpdated});
}

/// @nodoc
class _$ProductListCopyWithImpl<$Res, $Val extends ProductList>
    implements $ProductListCopyWith<$Res> {
  _$ProductListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? total = null,
    Object? skip = null,
    Object? limit = null,
    Object? hasMore = null,
    Object? isOffline = null,
    Object? searchQuery = null,
    Object? filters = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      skip: null == skip
          ? _value.skip
          : skip // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isOffline: null == isOffline
          ? _value.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductListImplCopyWith<$Res>
    implements $ProductListCopyWith<$Res> {
  factory _$$ProductListImplCopyWith(
          _$ProductListImpl value, $Res Function(_$ProductListImpl) then) =
      __$$ProductListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Product> products,
      int total,
      int skip,
      int limit,
      bool hasMore,
      bool isOffline,
      String searchQuery,
      Map<String, String> filters,
      DateTime? lastUpdated});
}

/// @nodoc
class __$$ProductListImplCopyWithImpl<$Res>
    extends _$ProductListCopyWithImpl<$Res, _$ProductListImpl>
    implements _$$ProductListImplCopyWith<$Res> {
  __$$ProductListImplCopyWithImpl(
      _$ProductListImpl _value, $Res Function(_$ProductListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? total = null,
    Object? skip = null,
    Object? limit = null,
    Object? hasMore = null,
    Object? isOffline = null,
    Object? searchQuery = null,
    Object? filters = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_$ProductListImpl(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      skip: null == skip
          ? _value.skip
          : skip // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isOffline: null == isOffline
          ? _value.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      filters: null == filters
          ? _value._filters
          : filters // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$ProductListImpl extends _ProductList {
  const _$ProductListImpl(
      {required final List<Product> products,
      required this.total,
      required this.skip,
      required this.limit,
      required this.hasMore,
      this.isOffline = false,
      this.searchQuery = '',
      final Map<String, String> filters = const {},
      this.lastUpdated})
      : _products = products,
        _filters = filters,
        super._();

  final List<Product> _products;
  @override
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final int total;
  @override
  final int skip;
  @override
  final int limit;
  @override
  final bool hasMore;
  @override
  @JsonKey()
  final bool isOffline;
  @override
  @JsonKey()
  final String searchQuery;
  final Map<String, String> _filters;
  @override
  @JsonKey()
  Map<String, String> get filters {
    if (_filters is EqualUnmodifiableMapView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_filters);
  }

  @override
  final DateTime? lastUpdated;

  @override
  String toString() {
    return 'ProductList(products: $products, total: $total, skip: $skip, limit: $limit, hasMore: $hasMore, isOffline: $isOffline, searchQuery: $searchQuery, filters: $filters, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductListImpl &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.skip, skip) || other.skip == skip) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.isOffline, isOffline) ||
                other.isOffline == isOffline) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            const DeepCollectionEquality().equals(other._filters, _filters) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      total,
      skip,
      limit,
      hasMore,
      isOffline,
      searchQuery,
      const DeepCollectionEquality().hash(_filters),
      lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductListImplCopyWith<_$ProductListImpl> get copyWith =>
      __$$ProductListImplCopyWithImpl<_$ProductListImpl>(this, _$identity);
}

abstract class _ProductList extends ProductList {
  const factory _ProductList(
      {required final List<Product> products,
      required final int total,
      required final int skip,
      required final int limit,
      required final bool hasMore,
      final bool isOffline,
      final String searchQuery,
      final Map<String, String> filters,
      final DateTime? lastUpdated}) = _$ProductListImpl;
  const _ProductList._() : super._();

  @override
  List<Product> get products;
  @override
  int get total;
  @override
  int get skip;
  @override
  int get limit;
  @override
  bool get hasMore;
  @override
  bool get isOffline;
  @override
  String get searchQuery;
  @override
  Map<String, String> get filters;
  @override
  DateTime? get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$ProductListImplCopyWith<_$ProductListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
