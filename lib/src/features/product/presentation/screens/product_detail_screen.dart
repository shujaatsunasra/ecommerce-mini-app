import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import '../../../../common/theme/app_theme.dart';
import '../../../../common/widgets/product_image_carousel.dart';
import '../../../../common/widgets/product_info_section.dart';
import '../../../../common/widgets/product_tabs.dart';
import '../../../../common/widgets/add_to_cart_bar.dart';
import '../bloc/product_detail_bloc.dart';
import '../bloc/product_detail_event.dart';
import '../bloc/product_detail_state.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';
import '../../../cart/presentation/bloc/cart_event.dart';
import '../../../wishlist/presentation/bloc/wishlist_bloc.dart';
import '../../../wishlist/presentation/bloc/wishlist_event.dart';
import '../../domain/entities/product.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productId;
  final String title;
  final String price;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final String seller;

  const ProductDetailScreen({
    super.key,
    required this.productId,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
    required this.seller,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _selectedColorIndex = 0;
  int _quantity = 1;
  int _selectedTabIndex = 0;
  bool _isInWishlist = false;

  @override
  void initState() {
    super.initState();
    // Load product details when screen initializes
    context.read<ProductDetailBloc>().add(
      ProductDetailEvent.loadProductDetail(
        productId: int.parse(widget.productId),
      ),
    );
  }

  List<Color> _getColorsFromProduct(Product? product) {
    if (product == null) {
      return [Colors.black, Colors.blue, Colors.red, Colors.green, Colors.orange];
    }
    
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

  void _toggleWishlist(Product product) {
    setState(() {
      _isInWishlist = !_isInWishlist;
    });
    
    if (_isInWishlist) {
      context.read<WishlistBloc>().add(
        WishlistEvent.addToWishlist(product),
      );
      HapticFeedback.mediumImpact();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Added ${product.title} to wishlist'),
          backgroundColor: AppPalette.primary,
          duration: const Duration(seconds: 2),
        ),
      );
    } else {
      context.read<WishlistBloc>().add(
        WishlistEvent.removeFromWishlist(product),
      );
      HapticFeedback.lightImpact();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Removed ${product.title} from wishlist'),
          backgroundColor: AppPalette.muted,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  void _addToCart(Product product) {
    context.read<CartBloc>().add(
      CartEvent.addToCart(product),
    );
    HapticFeedback.mediumImpact();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Added ${product.title} to cart'),
        backgroundColor: AppPalette.primary,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(
            color: AppPalette.surface,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: AppPalette.textPrimary,
            ),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: AppPalette.surface,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {
                HapticFeedback.lightImpact();
                // TODO: Implement share functionality
              },
              icon: const Icon(
                Icons.share,
                color: AppPalette.textPrimary,
              ),
            ),
          ),
          BlocBuilder<ProductDetailBloc, ProductDetailState>(
            builder: (context, state) {
              return Container(
                margin: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: AppPalette.surface,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: state.product != null ? () => _toggleWishlist(state.product!) : null,
                  icon: Icon(
                    _isInWishlist ? Icons.favorite : Icons.favorite_border,
                    color: _isInWishlist ? AppPalette.error : AppPalette.textPrimary,
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: AppSpacing.md),
        ],
      ),
      body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (product, isOffline) => _buildProductContent(product, isOffline),
            error: (message, isOffline) => _buildErrorState(message, isOffline),
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const SizedBox.shrink(),
            success: (product, isOffline) => _buildBottomBar(product),
            error: (message, isOffline) => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _buildProductContent(Product product, bool isOffline) {
    final colors = _getColorsFromProduct(product);
    
    return Column(
      children: [
        // Offline indicator
        if (isOffline)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            color: AppPalette.warning.withOpacity(0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.wifi_off, size: 16, color: AppPalette.warning),
                const SizedBox(width: 8),
                Text(
                  'You\'re offline - showing cached data',
                  style: AppTypography.bodySmall.copyWith(color: AppPalette.warning),
                ),
              ],
            ),
          ),
        
        // Product image section
        Expanded(
          flex: 2,
          child: Hero(
            tag: 'product_image_${widget.productId}',
            child: ProductImageCarousel(
              imageUrl: product.thumbnail ?? widget.imageUrl,
              onImageChanged: (index) {},
            ),
          ),
        ),
        
        // Product info section
        Expanded(
          flex: 3,
          child: Container(
            decoration: const BoxDecoration(
              color: AppPalette.surface,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(AppRadius.xl),
              ),
            ),
            child: Column(
              children: [
                ProductInfoSection(
                  title: product.title,
                  price: '\$${product.price.toStringAsFixed(2)}',
                  rating: product.rating,
                  reviewCount: 0, // Reviews not available in current Product entity
                  seller: product.brand ?? 'Unknown Brand',
                  colors: colors,
                  selectedColorIndex: _selectedColorIndex,
                  onColorSelected: (index) {
                    setState(() {
                      _selectedColorIndex = index;
                    });
                  },
                ),
                ProductTabs(
                  selectedIndex: _selectedTabIndex,
                  onTabSelected: (index) {
                    setState(() {
                      _selectedTabIndex = index;
                    });
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: _buildTabContent(product),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabContent(Product product) {
    switch (_selectedTabIndex) {
      case 0: // Description
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                style: AppTypography.titleMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                product.description,
                style: AppTypography.bodyMedium,
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'Specifications',
                style: AppTypography.titleMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              _buildSpecificationItem('Brand', product.brand ?? 'Unknown'),
              _buildSpecificationItem('Category', product.category),
              _buildSpecificationItem('Price', product.formattedPrice),
              _buildSpecificationItem('Discount', '${product.discountPercentage.toStringAsFixed(1)}%'),
              _buildSpecificationItem('Stock', '${product.stock} available'),
              _buildSpecificationItem('Rating', '${product.rating.toStringAsFixed(1)}/5'),
            ],
          ),
        );
      case 1: // Reviews
        return _buildReviewsTab(product);
      case 2: // Shipping
        return _buildShippingTab(product);
      default:
        return const SizedBox();
    }
  }

  Widget _buildSpecificationItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: AppTypography.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
                color: AppPalette.muted,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTypography.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewsTab(Product product) {
    // Reviews not available in current Product entity - show placeholder
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.reviews_outlined,
            size: 48,
            color: AppPalette.muted,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'No reviews yet',
            style: AppTypography.titleMedium.copyWith(
              color: AppPalette.muted,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Be the first to review this product!',
            style: AppTypography.bodyMedium.copyWith(
              color: AppPalette.muted,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.md),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement review functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Review functionality coming soon!'),
                  backgroundColor: AppPalette.primary,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppPalette.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.lg),
              ),
            ),
            child: const Text('Write a Review'),
          ),
        ],
      ),
    );
  }

  Widget _buildShippingTab(Product product) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shipping Information',
            style: AppTypography.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          _buildInfoCard(
            Icons.local_shipping,
            'Delivery Time',
            '3-5 business days',
          ),
          _buildInfoCard(
            Icons.security,
            'Warranty',
            '1 year warranty',
          ),
          _buildInfoCard(
            Icons.inventory,
            'Availability',
            product.stockStatus,
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Return Policy',
            style: AppTypography.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            'We offer a 30-day return policy for all products. Items must be in original condition with tags attached. Contact our support team for return instructions.',
            style: AppTypography.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String title, String value) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            Icon(icon, color: AppPalette.primary),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppPalette.muted,
                    ),
                  ),
                  Text(
                    value,
                    style: AppTypography.bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(String message, bool isOffline) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: AppPalette.error,
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'Oops! Something went wrong',
              style: AppTypography.titleLarge.copyWith(
                color: AppPalette.textPrimary,
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
            const SizedBox(height: AppSpacing.lg),
            ElevatedButton(
              onPressed: () {
                context.read<ProductDetailBloc>().add(
                  ProductDetailEvent.retryLoadProductDetail(
                    productId: int.parse(widget.productId),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppPalette.primary,
                foregroundColor: Colors.white,
              ),
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar(Product product) {
    return AddToCartBar(
      quantity: _quantity,
      onQuantityChanged: (quantity) {
        setState(() {
          _quantity = quantity;
        });
      },
      onAddToCart: () => _addToCart(product),
    );
  }
}
