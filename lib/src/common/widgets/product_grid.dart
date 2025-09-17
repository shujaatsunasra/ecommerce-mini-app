import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../theme/app_theme.dart';
import 'product_card.dart';
import '../../features/product/presentation/bloc/product_list_bloc.dart';
import '../../features/product/presentation/bloc/product_list_state.dart';
import '../../features/wishlist/presentation/bloc/wishlist_bloc.dart';
import '../../features/wishlist/presentation/bloc/wishlist_event.dart';

class ProductGrid extends StatelessWidget {
  final VoidCallback? onProductTap;
  final String? title;
  final bool showHeader;
  
  const ProductGrid({
    super.key, 
    this.onProductTap,
    this.title,
    this.showHeader = true,
  });

  List<Color> _getColorsFromProduct(dynamic product) {
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
    return BlocBuilder<ProductListBloc, ProductListState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showHeader) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title ?? 'Products',
                      style: AppTypography.headlineSmall,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'See all',
                        style: TextStyle(
                          color: AppPalette.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
            ],
            SizedBox(
              height: 280,
              child: state.when(
                initial: () => const Center(child: CircularProgressIndicator()),
                loading: () => const Center(child: CircularProgressIndicator()),
                success: (productList, isLoadingMore) {
                  final products = productList.products.take(5).toList();
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: AppSpacing.lg),
                        child: ProductCard(
                          title: product.title,
                          price: '\$${product.price.toStringAsFixed(2)}',
                          imageUrl: product.thumbnail ?? 'https://via.placeholder.com/200x200/FF6B35/FFFFFF?text=Product',
                          colors: _getColorsFromProduct(product),
                          rating: product.rating,
                          brand: product.brand,
                          productId: product.id.toString(),
                          onTap: onProductTap ?? () {},
                          onFavorite: () {
                            context.read<WishlistBloc>().add(
                              WishlistEvent.addToWishlist(product),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                error: (message, productList, isLoadingMore) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 48,
                        color: AppPalette.error,
                      ),
                      const SizedBox(height: AppSpacing.md),
                      Text(
                        'Error loading products',
                        style: AppTypography.titleMedium.copyWith(
                          color: AppPalette.error,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        message,
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppPalette.muted,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                empty: (message, isLoadingMore) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.inventory_2_outlined,
                        size: 48,
                        color: AppPalette.muted,
                      ),
                      const SizedBox(height: AppSpacing.md),
                      Text(
                        'No products available',
                        style: AppTypography.titleMedium.copyWith(
                          color: AppPalette.textPrimary,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        'Check back later for new products',
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppPalette.muted,
                        ),
                      ),
                    ],
                  ),
                ),
                loadingMore: (productList) {
                  final products = productList.products.take(5).toList();
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: AppSpacing.lg),
                        child: ProductCard(
                          title: product.title,
                          price: '\$${product.price.toStringAsFixed(2)}',
                          imageUrl: product.thumbnail ?? 'https://via.placeholder.com/200x200/FF6B35/FFFFFF?text=Product',
                          colors: _getColorsFromProduct(product),
                          rating: product.rating,
                          brand: product.brand,
                          productId: product.id.toString(),
                          onTap: onProductTap ?? () {},
                          onFavorite: () {
                            context.read<WishlistBloc>().add(
                              WishlistEvent.addToWishlist(product),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

