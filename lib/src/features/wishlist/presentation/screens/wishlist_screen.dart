import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/theme/app_theme.dart';
import '../bloc/wishlist_bloc.dart';
import '../../../product/domain/entities/product.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import '../../../cart/presentation/bloc/cart_event.dart';
import '../bloc/wishlist_state.dart';
import '../bloc/wishlist_event.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));

    _animationController.forward();
    
    // Load wishlist items
    context.read<WishlistBloc>().add(const WishlistEvent.loadWishlist());
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onBackPressed() {
    HapticFeedback.selectionClick();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.background,
      appBar: AppBar(
        backgroundColor: AppPalette.surface,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Wishlist',
          style: AppTypography.headlineSmall.copyWith(
            fontWeight: FontWeight.bold,
            color: AppPalette.textPrimary,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Notification action
              HapticFeedback.lightImpact();
            },
            icon: Icon(
              Icons.notifications_outlined,
              color: AppPalette.textPrimary,
            ),
          ),
        ],
      ),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (wishlist) {
              if (wishlist.products.isEmpty) {
                return FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite_outline,
                            size: 80,
                            color: AppPalette.muted,
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          Text(
                            'Your wishlist is empty',
                            style: AppTypography.headlineSmall.copyWith(
                              color: AppPalette.muted,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          Text(
                            'Add some items to your wishlist',
                            style: AppTypography.bodyMedium.copyWith(
                              color: AppPalette.muted,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppPalette.primary,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(AppRadius.lg),
                              ),
                            ),
                            child: const Text('Start Shopping'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }

              return FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Column(
                    children: [
                      // Wishlist header
                      Container(
                        padding: const EdgeInsets.all(AppSpacing.lg),
                        child: Row(
                          children: [
                            Text(
                              '${wishlist.products.length} ${wishlist.products.length == 1 ? 'item' : 'items'} in wishlist',
                              style: AppTypography.titleMedium.copyWith(
                                color: AppPalette.muted,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                context.read<WishlistBloc>().add(
                                  WishlistEvent.clearWishlist(),
                                );
                                HapticFeedback.mediumImpact();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text('Wishlist cleared'),
                                    backgroundColor: AppPalette.primary,
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.clear_all,
                                color: AppPalette.muted,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Wishlist items
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                          itemCount: wishlist.products.length,
                          itemBuilder: (context, index) {
                            final item = wishlist.products[index];
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.only(bottom: AppSpacing.md),
                              child: _buildModernWishlistItem(item, index),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            error: (failure) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 80,
                    color: AppPalette.error,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    'Error loading wishlist',
                    style: AppTypography.headlineSmall.copyWith(
                      color: AppPalette.textPrimary,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    failure.toString(),
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppPalette.muted,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildModernWishlistItem(Product item, int index) {
    return Container(
      decoration: BoxDecoration(
        color: AppPalette.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            // Product image
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppPalette.surfaceVariant.withValues(alpha: 0.3),
              ),
              child: Hero(
                tag: 'product_image_${item.id}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    item.thumbnail ?? 'https://via.placeholder.com/80x80/FF6B35/FFFFFF?text=Product',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppPalette.primary.withValues(alpha: 0.1),
                              AppPalette.accent.withValues(alpha: 0.1),
                            ],
                          ),
                        ),
                        child: const Icon(
                          Icons.image_outlined,
                          color: AppPalette.muted,
                          size: 32,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            // Product details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: AppTypography.titleSmall.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppPalette.textPrimary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.category,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppPalette.muted,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '\$${item.price.toStringAsFixed(2)}',
                        style: AppTypography.titleMedium.copyWith(
                          color: AppPalette.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      // Rating if available
                      if (item.rating != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppPalette.warning.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star,
                                size: 14,
                                color: AppPalette.warning,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                item.rating!.toStringAsFixed(1),
                                style: AppTypography.bodySmall.copyWith(
                                  color: AppPalette.warning,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            // Action buttons
            Column(
              children: [
                // Add to cart button
                IconButton(
                  onPressed: () {
                    context.read<CartBloc>().add(
                      CartEvent.addToCart(item),
                    );
                    HapticFeedback.lightImpact();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${item.title} added to cart'),
                        backgroundColor: AppPalette.success,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: AppPalette.primary,
                    size: 20,
                  ),
                ),
                // Remove from wishlist button
                IconButton(
                  onPressed: () {
                    context.read<WishlistBloc>().add(
                      WishlistEvent.removeFromWishlist(item),
                    );
                    HapticFeedback.mediumImpact();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${item.title} removed from wishlist'),
                        backgroundColor: AppPalette.error,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.favorite,
                    color: AppPalette.error,
                    size: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
