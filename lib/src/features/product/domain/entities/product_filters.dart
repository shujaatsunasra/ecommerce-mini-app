import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_filters.freezed.dart';

@freezed
class ProductFilters with _$ProductFilters {
  const factory ProductFilters({
    @Default('') String searchQuery,
    @Default('') String category,
    @Default('') String brand,
    @Default(0.0) double minPrice,
    @Default(0.0) double maxPrice,
    @Default(0.0) double minRating,
    @Default(false) bool inStockOnly,
    @Default(SortBy.relevance) SortBy sortBy,
    @Default(SortOrder.desc) SortOrder sortOrder,
  }) = _ProductFilters;

  factory ProductFilters.empty() => const ProductFilters();
  
  factory ProductFilters.search(String query) => ProductFilters(searchQuery: query);
  
  factory ProductFilters.category(String category) => ProductFilters(category: category);
  
  factory ProductFilters.priceRange(double minPrice, double maxPrice) => 
    ProductFilters(minPrice: minPrice, maxPrice: maxPrice);
  
  factory ProductFilters.rating(double minRating) => ProductFilters(minRating: minRating);
  
  factory ProductFilters.inStock() => const ProductFilters(inStockOnly: true);
}

enum SortBy {
  relevance,
  price,
  rating,
  title,
  brand,
  category,
  stock,
}

enum SortOrder {
  asc,
  desc,
}

extension ProductFiltersExtension on ProductFilters {
  bool get hasActiveFilters => 
    searchQuery.isNotEmpty ||
    category.isNotEmpty ||
    brand.isNotEmpty ||
    minPrice > 0 ||
    maxPrice > 0 ||
    minRating > 0 ||
    inStockOnly ||
    sortBy != SortBy.relevance;

  Map<String, String> toQueryParams() {
    final params = <String, String>{};
    
    if (searchQuery.isNotEmpty) {
      params['q'] = searchQuery;
    }
    if (category.isNotEmpty) {
      params['category'] = category;
    }
    if (brand.isNotEmpty) {
      params['brand'] = brand;
    }
    if (minPrice > 0) {
      params['minPrice'] = minPrice.toString();
    }
    if (maxPrice > 0) {
      params['maxPrice'] = maxPrice.toString();
    }
    if (minRating > 0) {
      params['minRating'] = minRating.toString();
    }
    if (inStockOnly) {
      params['inStock'] = 'true';
    }
    
    // Add sorting parameters
    if (sortBy != SortBy.relevance) {
      params['sortBy'] = sortBy.name;
      params['sortOrder'] = sortOrder.name;
    }
    
    return params;
  }
  
  String get displayText {
    if (!hasActiveFilters) return 'No filters applied';
    
    final parts = <String>[];
    
    if (searchQuery.isNotEmpty) {
      parts.add('Search: "$searchQuery"');
    }
    if (category.isNotEmpty) {
      parts.add('Category: $category');
    }
    if (brand.isNotEmpty) {
      parts.add('Brand: $brand');
    }
    if (minPrice > 0 || maxPrice > 0) {
      if (minPrice > 0 && maxPrice > 0) {
        parts.add('Price: \$${minPrice.toStringAsFixed(0)} - \$${maxPrice.toStringAsFixed(0)}');
      } else if (minPrice > 0) {
        parts.add('Price: \$${minPrice.toStringAsFixed(0)}+');
      } else if (maxPrice > 0) {
        parts.add('Price: up to \$${maxPrice.toStringAsFixed(0)}');
      }
    }
    if (minRating > 0) {
      parts.add('Rating: ${minRating.toStringAsFixed(1)}+ stars');
    }
    if (inStockOnly) {
      parts.add('In stock only');
    }
    
    return parts.join(' • ');
  }
}
