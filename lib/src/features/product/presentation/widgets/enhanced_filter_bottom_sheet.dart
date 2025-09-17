import 'package:flutter/material.dart';
import '../../domain/entities/product_filters.dart';

class EnhancedFilterBottomSheet extends StatefulWidget {
  final ProductFilters currentFilters;
  final Function(ProductFilters) onApplyFilters;

  const EnhancedFilterBottomSheet({
    super.key,
    required this.currentFilters,
    required this.onApplyFilters,
  });

  @override
  State<EnhancedFilterBottomSheet> createState() => _EnhancedFilterBottomSheetState();
}

class _EnhancedFilterBottomSheetState extends State<EnhancedFilterBottomSheet>
    with TickerProviderStateMixin {
  late ProductFilters _filters;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _filters = widget.currentFilters;
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _applyFilters() {
    widget.onApplyFilters(_filters);
    Navigator.of(context).pop();
  }

  void _clearFilters() {
    setState(() {
      _filters = const ProductFilters();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Header
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const Text(
                  'Filters',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: _clearFilters,
                  child: const Text('Clear All'),
                ),
              ],
            ),
          ),

          // Tab bar
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Category'),
              Tab(text: 'Price'),
              Tab(text: 'Rating'),
              Tab(text: 'Sort'),
            ],
            labelColor: Theme.of(context).colorScheme.primary,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Theme.of(context).colorScheme.primary,
          ),

          // Tab content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _CategoryTab(filters: _filters, onChanged: (f) => setState(() => _filters = f)),
                _PriceTab(filters: _filters, onChanged: (f) => setState(() => _filters = f)),
                _RatingTab(filters: _filters, onChanged: (f) => setState(() => _filters = f)),
                _SortTab(filters: _filters, onChanged: (f) => setState(() => _filters = f)),
              ],
            ),
          ),

          // Apply button
          Container(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _applyFilters,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Apply Filters',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryTab extends StatelessWidget {
  final ProductFilters filters;
  final Function(ProductFilters) onChanged;

  const _CategoryTab({
    required this.filters,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final categories = [
      'smartphones',
      'laptops',
      'fragrances',
      'skincare',
      'groceries',
      'home-decoration',
      'furniture',
      'tops',
      'womens-dresses',
      'womens-shoes',
      'mens-shirts',
      'mens-shoes',
      'mens-watches',
      'womens-watches',
      'womens-bags',
      'womens-jewellery',
      'sunglasses',
      'automotive',
      'motorcycle',
      'lighting',
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        final isSelected = filters.category == category;
        
        return ListTile(
          title: Text(category.replaceAll('-', ' ').toUpperCase()),
          trailing: isSelected
              ? Icon(
                  Icons.check_circle,
                  color: Theme.of(context).colorScheme.primary,
                )
              : null,
          onTap: () {
            onChanged(filters.copyWith(
              category: isSelected ? '' : category,
            ));
          },
        );
      },
    );
  }
}

class _PriceTab extends StatefulWidget {
  final ProductFilters filters;
  final Function(ProductFilters) onChanged;

  const _PriceTab({
    required this.filters,
    required this.onChanged,
  });

  @override
  State<_PriceTab> createState() => _PriceTabState();
}

class _PriceTabState extends State<_PriceTab> {
  late RangeValues _priceRange;

  @override
  void initState() {
    super.initState();
    _priceRange = RangeValues(
      widget.filters.minPrice,
      widget.filters.maxPrice > 0 ? widget.filters.maxPrice : 1000,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Price Range: \$${_priceRange.start.round()} - \$${_priceRange.end.round()}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          RangeSlider(
            values: _priceRange,
            min: 0,
            max: 2000,
            divisions: 40,
            onChanged: (values) {
              setState(() {
                _priceRange = values;
              });
              widget.onChanged(widget.filters.copyWith(
                minPrice: values.start,
                maxPrice: values.end,
              ));
            },
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Min: \$${_priceRange.start.round()}',
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  'Max: \$${_priceRange.end.round()}',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CheckboxListTile(
            title: const Text('In Stock Only'),
            value: widget.filters.inStockOnly,
            onChanged: (value) {
              widget.onChanged(widget.filters.copyWith(
                inStockOnly: value ?? false,
              ));
            },
          ),
        ],
      ),
    );
  }
}

class _RatingTab extends StatelessWidget {
  final ProductFilters filters;
  final Function(ProductFilters) onChanged;

  const _RatingTab({
    required this.filters,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Minimum Rating: ${filters.minRating.toStringAsFixed(1)} ⭐',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Slider(
            value: filters.minRating,
            min: 0,
            max: 5,
            divisions: 50,
            onChanged: (value) {
              onChanged(filters.copyWith(minRating: value));
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(6, (index) {
              final rating = index.toDouble();
              final isSelected = filters.minRating >= rating;
              
              return GestureDetector(
                onTap: () {
                  onChanged(filters.copyWith(minRating: rating));
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    rating == 0 ? 'Any' : rating.toStringAsFixed(1),
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _SortTab extends StatelessWidget {
  final ProductFilters filters;
  final Function(ProductFilters) onChanged;

  const _SortTab({
    required this.filters,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sort By',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ...SortBy.values.map((sortBy) {
            return RadioListTile<SortBy>(
              title: Text(sortBy.name.toUpperCase()),
              value: sortBy,
              groupValue: filters.sortBy,
              onChanged: (value) {
                if (value != null) {
                  onChanged(filters.copyWith(sortBy: value));
                }
              },
            );
          }),
          const SizedBox(height: 20),
          const Text(
            'Sort Order',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          ...SortOrder.values.map((sortOrder) {
            return RadioListTile<SortOrder>(
              title: Text(sortOrder.name.toUpperCase()),
              value: sortOrder,
              groupValue: filters.sortOrder,
              onChanged: (value) {
                if (value != null) {
                  onChanged(filters.copyWith(sortOrder: value));
                }
              },
            );
          }),
        ],
      ),
    );
  }
}
