// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_filters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductFilters {
  String get searchQuery => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  double get minPrice => throw _privateConstructorUsedError;
  double get maxPrice => throw _privateConstructorUsedError;
  double get minRating => throw _privateConstructorUsedError;
  bool get inStockOnly => throw _privateConstructorUsedError;
  SortBy get sortBy => throw _privateConstructorUsedError;
  SortOrder get sortOrder => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductFiltersCopyWith<ProductFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductFiltersCopyWith<$Res> {
  factory $ProductFiltersCopyWith(
          ProductFilters value, $Res Function(ProductFilters) then) =
      _$ProductFiltersCopyWithImpl<$Res, ProductFilters>;
  @useResult
  $Res call(
      {String searchQuery,
      String category,
      String brand,
      double minPrice,
      double maxPrice,
      double minRating,
      bool inStockOnly,
      SortBy sortBy,
      SortOrder sortOrder});
}

/// @nodoc
class _$ProductFiltersCopyWithImpl<$Res, $Val extends ProductFilters>
    implements $ProductFiltersCopyWith<$Res> {
  _$ProductFiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? category = null,
    Object? brand = null,
    Object? minPrice = null,
    Object? maxPrice = null,
    Object? minRating = null,
    Object? inStockOnly = null,
    Object? sortBy = null,
    Object? sortOrder = null,
  }) {
    return _then(_value.copyWith(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      minPrice: null == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as double,
      maxPrice: null == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as double,
      minRating: null == minRating
          ? _value.minRating
          : minRating // ignore: cast_nullable_to_non_nullable
              as double,
      inStockOnly: null == inStockOnly
          ? _value.inStockOnly
          : inStockOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as SortBy,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as SortOrder,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductFiltersImplCopyWith<$Res>
    implements $ProductFiltersCopyWith<$Res> {
  factory _$$ProductFiltersImplCopyWith(_$ProductFiltersImpl value,
          $Res Function(_$ProductFiltersImpl) then) =
      __$$ProductFiltersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String searchQuery,
      String category,
      String brand,
      double minPrice,
      double maxPrice,
      double minRating,
      bool inStockOnly,
      SortBy sortBy,
      SortOrder sortOrder});
}

/// @nodoc
class __$$ProductFiltersImplCopyWithImpl<$Res>
    extends _$ProductFiltersCopyWithImpl<$Res, _$ProductFiltersImpl>
    implements _$$ProductFiltersImplCopyWith<$Res> {
  __$$ProductFiltersImplCopyWithImpl(
      _$ProductFiltersImpl _value, $Res Function(_$ProductFiltersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = null,
    Object? category = null,
    Object? brand = null,
    Object? minPrice = null,
    Object? maxPrice = null,
    Object? minRating = null,
    Object? inStockOnly = null,
    Object? sortBy = null,
    Object? sortOrder = null,
  }) {
    return _then(_$ProductFiltersImpl(
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      minPrice: null == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as double,
      maxPrice: null == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as double,
      minRating: null == minRating
          ? _value.minRating
          : minRating // ignore: cast_nullable_to_non_nullable
              as double,
      inStockOnly: null == inStockOnly
          ? _value.inStockOnly
          : inStockOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      sortBy: null == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as SortBy,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as SortOrder,
    ));
  }
}

/// @nodoc

class _$ProductFiltersImpl implements _ProductFilters {
  const _$ProductFiltersImpl(
      {this.searchQuery = '',
      this.category = '',
      this.brand = '',
      this.minPrice = 0.0,
      this.maxPrice = 0.0,
      this.minRating = 0.0,
      this.inStockOnly = false,
      this.sortBy = SortBy.relevance,
      this.sortOrder = SortOrder.desc});

  @override
  @JsonKey()
  final String searchQuery;
  @override
  @JsonKey()
  final String category;
  @override
  @JsonKey()
  final String brand;
  @override
  @JsonKey()
  final double minPrice;
  @override
  @JsonKey()
  final double maxPrice;
  @override
  @JsonKey()
  final double minRating;
  @override
  @JsonKey()
  final bool inStockOnly;
  @override
  @JsonKey()
  final SortBy sortBy;
  @override
  @JsonKey()
  final SortOrder sortOrder;

  @override
  String toString() {
    return 'ProductFilters(searchQuery: $searchQuery, category: $category, brand: $brand, minPrice: $minPrice, maxPrice: $maxPrice, minRating: $minRating, inStockOnly: $inStockOnly, sortBy: $sortBy, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductFiltersImpl &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice) &&
            (identical(other.minRating, minRating) ||
                other.minRating == minRating) &&
            (identical(other.inStockOnly, inStockOnly) ||
                other.inStockOnly == inStockOnly) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchQuery, category, brand,
      minPrice, maxPrice, minRating, inStockOnly, sortBy, sortOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductFiltersImplCopyWith<_$ProductFiltersImpl> get copyWith =>
      __$$ProductFiltersImplCopyWithImpl<_$ProductFiltersImpl>(
          this, _$identity);
}

abstract class _ProductFilters implements ProductFilters {
  const factory _ProductFilters(
      {final String searchQuery,
      final String category,
      final String brand,
      final double minPrice,
      final double maxPrice,
      final double minRating,
      final bool inStockOnly,
      final SortBy sortBy,
      final SortOrder sortOrder}) = _$ProductFiltersImpl;

  @override
  String get searchQuery;
  @override
  String get category;
  @override
  String get brand;
  @override
  double get minPrice;
  @override
  double get maxPrice;
  @override
  double get minRating;
  @override
  bool get inStockOnly;
  @override
  SortBy get sortBy;
  @override
  SortOrder get sortOrder;
  @override
  @JsonKey(ignore: true)
  _$$ProductFiltersImplCopyWith<_$ProductFiltersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
