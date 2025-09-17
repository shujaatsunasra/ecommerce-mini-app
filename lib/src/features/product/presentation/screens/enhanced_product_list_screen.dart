import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/product_filters.dart';
import '../bloc/product_list_bloc.dart';
import '../bloc/product_list_event.dart';
import '../bloc/product_list_state.dart';
import '../../../wishlist/presentation/bloc/wishlist_bloc.dart';
import '../../../wishlist/presentation/bloc/wishlist_event.dart';
import '../../../../common/widgets/product_card.dart';
import '../../../../common/widgets/shimmer_placeholder.dart';
import '../../../../common/theme/app_theme.dart';
import '../widgets/enhanced_filter_bottom_sheet.dart';
import '../widgets/empty_state_widget.dart';
import '../widgets/error_state_widget.dart';

class EnhancedProductListScreen extends StatefulWidget {
  const EnhancedProductListScreen({super.key});

  @override
  State<EnhancedProductListScreen> createState() => _EnhancedProductListScreenState();
}

class _EnhancedProductListScreenState extends State<EnhancedProductListScreen>
    with TickerProviderStateMixin {
  late final ScrollController _scrollController;
  late final TextEditingController _searchController;
  late final AnimationController _fadeController;
  late final AnimationController _slideController;
  
  ProductFilters _currentFilters = const ProductFilters();
  String _searchQuery = '';

  List<Color> _getColorsFromProduct(Product product) {
    // Generate colors based on product category or use default colors
    switch (product.category.toLowerCase()) {
      case 'electronics':
        return [Colors.black, Colors.grey, Colors.blue, Colors.red];
      case 'clothing':
        return [Colors.black, Colors.white, Colors.blue, Colors.red, Colors.green];
      case 'beauty':
        return [Colors.pink, Colors.purple, Colors.orange, Colors.red];
      case 'home':
        return [Colors.brown, Colors.grey.shade300, Colors.grey, Colors.blue];
      default:
        return [Colors.black, Colors.blue, Colors.red, Colors.green, Colors.orange];
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _searchController = TextEditingController();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _scrollController.addListener(_onScroll);
    
    // Load initial products
    context.read<ProductListBloc>().add(const LoadProducts());
    
    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      final state = context.read<ProductListBloc>().state;
      if (state.canLoadMore && !state.isLoadingMore) {
        context.read<ProductListBloc>().add(const LoadMoreProducts());
      }
    }
  }

  void _onSearch(String query) {
    setState(() {
      _searchQuery = query;
    });

    if (query.isEmpty) {
      context.read<ProductListBloc>().add(const LoadProducts());
    } else {
      context.read<ProductListBloc>().add(SearchProducts(
        query: query,
        additionalFilters: _currentFilters,
      ));
    }
  }

  void _onFilterTap() async {
    final filters = await showModalBottomSheet<ProductFilters>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => EnhancedFilterBottomSheet(
        currentFilters: _currentFilters,
        onApplyFilters: (filters) {
          setState(() {
            _currentFilters = filters;
          });
          
          if (_searchQuery.isNotEmpty) {
            context.read<ProductListBloc>().add(SearchProducts(
              query: _searchQuery,
              additionalFilters: filters,
            ));
          } else {
            context.read<ProductListBloc>().add(FilterProducts(
              productFilters: filters,
            ));
          }
        },
      ),
    );

    if (filters != null) {
      setState(() {
        _currentFilters = filters;
      });
    }
  }

  void _onClearFilters() {
    setState(() {
      _currentFilters = const ProductFilters();
      _searchQuery = '';
      _searchController.clear();
    });
    
    context.read<ProductListBloc>().add(const ClearFilters());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          // Filter Chips
          if (_currentFilters.hasActiveFilters)
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Chip(
                    label: Text(_currentFilters.displayText),
                    onDeleted: _onClearFilters,
                    deleteIcon: const Icon(Icons.close, size: 18),
                  ),
                ],
              ),
            ),

          // Offline indicator removed - handled in main products screen

          // Product List
          Expanded(
            child: BlocBuilder<ProductListBloc, ProductListState>(
              builder: (context, state) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: state.when(
                    initial: () => const _LoadingWidget(),
                    loading: () => const _LoadingWidget(),
                    loadingMore: (productList) => _ProductGrid(
                      products: productList.products,
                      isLoadingMore: true,
                      onProductTap: _onProductTap,
                    ),
                    success: (productList, isOffline) => _ProductGrid(
                      products: productList.products,
                      isLoadingMore: false,
                      onProductTap: _onProductTap,
                    ),
                    error: (message, productList, isOffline) => productList != null
                        ? _ProductGrid(
                            products: productList.products,
                            isLoadingMore: false,
                            onProductTap: _onProductTap,
                            errorMessage: message,
                          )
                        : ErrorStateWidget(
                            message: message,
                            onRetry: () {
                              context.read<ProductListBloc>().add(const RetryLoad());
                            },
                          ),
                    empty: (message, isOffline) => EmptyStateWidget(
                      message: message,
                      onRetry: () {
                        context.read<ProductListBloc>().add(const RetryLoad());
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
  }

  void _onProductTap(Product product) {
    // Navigate to product detail screen
    Navigator.of(context).pushNamed(
      '/product-detail',
      arguments: {
        'productId': product.id.toString(),
        'title': product.title,
        'price': '\$${product.price.toStringAsFixed(2)}',
        'imageUrl': product.thumbnail ?? 'https://via.placeholder.com/300x300/FF6B35/FFFFFF?text=Product',
        'rating': product.rating,
        'reviewCount': 0, // You can add review count to Product entity if needed
        'seller': 'Unknown', // You can add seller to Product entity if needed
      },
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(AppSpacing.lg),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: AppSpacing.md,
        mainAxisSpacing: AppSpacing.md,
      ),
      itemCount: 6,
      itemBuilder: (context, index) => const ShimmerProductCard(),
    );
  }
}


class _ProductGrid extends StatelessWidget {
  final List<Product> products;
  final bool isLoadingMore;
  final Function(Product) onProductTap;
  final String? errorMessage;

  const _ProductGrid({
    required this.products,
    required this.isLoadingMore,
    required this.onProductTap,
    this.errorMessage,
  });

  List<Color> _getColorsFromProduct(Product product) {
    // Generate colors based on product category or use default colors
    switch (product.category.toLowerCase()) {
      case 'electronics':
        return [Colors.black, Colors.grey, Colors.blue, Colors.red];
      case 'clothing':
        return [Colors.black, Colors.white, Colors.blue, Colors.red, Colors.green];
      case 'beauty':
        return [Colors.pink, Colors.purple, Colors.orange, Colors.red];
      case 'home':
        return [Colors.brown, Colors.grey.shade300, Colors.grey, Colors.blue];
      default:
        return [Colors.black, Colors.blue, Colors.red, Colors.green, Colors.orange];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(AppSpacing.lg),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: AppSpacing.md,
              mainAxisSpacing: AppSpacing.md,
            ),
            itemCount: products.length + (isLoadingMore ? 2 : 0),
            itemBuilder: (context, index) {
              if (index >= products.length) {
                return const ShimmerProductCard();
              }
              
              final product = products[index];
              return RepaintBoundary(
                child: ProductCard(
                  key: ValueKey('product-${product.id}'),
                  title: product.title,
                  price: '\$${product.price.toStringAsFixed(2)}',
                  imageUrl: product.thumbnail ?? 'https://via.placeholder.com/200x200/FF6B35/FFFFFF?text=Product',
                  colors: _getColorsFromProduct(product),
                  rating: product.rating,
                  brand: product.brand,
                  productId: product.id.toString(),
                  onTap: () => onProductTap(product),
                  onFavorite: () {
                    context.read<WishlistBloc>().add(
                      WishlistEvent.addToWishlist(product),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Added ${product.title} to wishlist'),
                        backgroundColor: AppPalette.primary,
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
        
        // Error message for partial load
        if (errorMessage != null)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.lg),
            color: Theme.of(context).colorScheme.errorContainer,
            child: Text(
              errorMessage!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onErrorContainer,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
  }
}
