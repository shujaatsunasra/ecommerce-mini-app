import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/theme/app_theme.dart';
import '../bloc/cart_bloc.dart';
import '../../domain/entities/cart_item.dart';
import '../bloc/cart_state.dart';
import '../bloc/cart_event.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with TickerProviderStateMixin {
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
    
    // Load cart items
    context.read<CartBloc>().add(const CartEvent.loadCart());
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

  void _onCheckout() {
    HapticFeedback.mediumImpact();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Checkout functionality coming soon!'),
        backgroundColor: AppPalette.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.sm),
        ),
      ),
    );
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
          'My Cart',
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
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (cart) {
              if (cart.items.isEmpty) {
                return FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart_outlined,
                            size: 80,
                            color: AppPalette.muted,
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          Text(
                            'Your cart is empty',
                            style: AppTypography.headlineSmall.copyWith(
                              color: AppPalette.muted,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.md),
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppPalette.primary,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(AppRadius.lg),
                              ),
                            ),
                            child: const Text('Continue Shopping'),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }

              final subtotal = cart.items.fold<double>(
                0,
                (sum, item) => sum + (item.product.price * item.quantity),
              );

              return FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Column(
                    children: [
                      // Cart header with item count
                      Container(
                        padding: const EdgeInsets.all(AppSpacing.lg),
                        child: Row(
                          children: [
                            Text(
                              '${cart.totalItems} ${cart.totalItems == 1 ? 'item' : 'items'} in cart',
                              style: AppTypography.titleMedium.copyWith(
                                color: AppPalette.muted,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '\$${subtotal.toStringAsFixed(2)}',
                              style: AppTypography.titleLarge.copyWith(
                                color: AppPalette.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Cart items list
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                          itemCount: cart.items.length,
                          itemBuilder: (context, index) {
                            final item = cart.items[index];
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.only(bottom: AppSpacing.md),
                              child: _buildModernCartItem(item, index),
                            );
                          },
                        ),
                      ),
                      // Checkout section
                      _buildCheckoutSection(subtotal),
                    ],
                  ),
                ),
              );
            },
            error: (message) => Center(
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
                    'Error loading cart',
                    style: AppTypography.headlineSmall.copyWith(
                      color: AppPalette.textPrimary,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    message,
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

  Widget _buildModernCartItem(CartItem item, int index) {
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
                tag: 'product_image_${item.product.id}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    item.product.thumbnail ?? 'https://via.placeholder.com/80x80/FF6B35/FFFFFF?text=Product',
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
                    item.product.title,
                    style: AppTypography.titleSmall.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppPalette.textPrimary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.product.category,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppPalette.muted,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '\$${item.product.price.toStringAsFixed(2)}',
                        style: AppTypography.titleMedium.copyWith(
                          color: AppPalette.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      // Quantity controls
                      Container(
                        decoration: BoxDecoration(
                          color: AppPalette.surfaceVariant.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                if (item.quantity > 1) {
                                  context.read<CartBloc>().add(
                                    CartEvent.updateQuantity(
                                      item.product,
                                      item.quantity - 1,
                                    ),
                                  );
                                  HapticFeedback.lightImpact();
                                }
                              },
                              icon: const Icon(
                                Icons.remove,
                                size: 18,
                                color: AppPalette.muted,
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 32,
                                minHeight: 32,
                              ),
                              padding: EdgeInsets.zero,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                '${item.quantity}',
                                style: AppTypography.titleSmall.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                context.read<CartBloc>().add(
                                  CartEvent.updateQuantity(
                                    item.product,
                                    item.quantity + 1,
                                  ),
                                );
                                HapticFeedback.lightImpact();
                              },
                              icon: const Icon(
                                Icons.add,
                                size: 18,
                                color: AppPalette.primary,
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 32,
                                minHeight: 32,
                              ),
                              padding: EdgeInsets.zero,
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
            // Remove button
            IconButton(
              onPressed: () {
                context.read<CartBloc>().add(
                  CartEvent.removeFromCart(item.product),
                );
                HapticFeedback.mediumImpact();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${item.product.title} removed from cart'),
                    backgroundColor: AppPalette.error,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.delete_outline,
                color: AppPalette.error,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckoutSection(double subtotal) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppPalette.surface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Order summary
          Row(
            children: [
              Text(
                'Subtotal',
                style: AppTypography.titleMedium.copyWith(
                  color: AppPalette.textPrimary,
                ),
              ),
              const Spacer(),
              Text(
                '\$${subtotal.toStringAsFixed(2)}',
                style: AppTypography.titleLarge.copyWith(
                  color: AppPalette.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              Text(
                'Shipping',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppPalette.muted,
                ),
              ),
              const Spacer(),
              Text(
                'Free',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppPalette.success,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          // Checkout button
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: _onCheckout,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppPalette.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.shopping_bag_outlined, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'Checkout',
                    style: AppTypography.titleMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
