import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_theme.dart';

class ProductCard extends StatefulWidget {
  final String title;
  final String price;
  final String imageUrl;
  final List<Color> colors;
  final VoidCallback onTap;
  final VoidCallback onFavorite;
  final double? rating;
  final String? brand;
  final bool? isInWishlist;
  final String? productId;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.colors,
    required this.onTap,
    required this.onFavorite,
    this.rating,
    this.brand,
    this.isInWishlist = false,
    this.productId,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onCardTap() {
    HapticFeedback.selectionClick();
    _animationController.forward().then((_) {
      _animationController.reverse();
    });
    widget.onTap();
  }

  void _onFavoriteTap() {
    HapticFeedback.mediumImpact();
    _animationController.forward().then((_) {
      _animationController.reverse();
    });
    widget.onFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: GestureDetector(
            onTap: _onCardTap,
            child: Container(
              width: 180,
              constraints: const BoxConstraints(
                minHeight: 220,
                maxHeight: 280,
              ),
              decoration: BoxDecoration(
                color: AppPalette.surface,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                    spreadRadius: 0,
                  ),
                ],
                border: Border.all(
                  color: AppPalette.mutedLight.withValues(alpha: 0.3),
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Image section - flexible height
                  Flexible(
                    flex: 2,
                    child: Container(
                      height: 130,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppPalette.surfaceVariant.withValues(alpha: 0.3),
                            AppPalette.surfaceVariant.withValues(alpha: 0.1),
                          ],
                        ),
                      ),
                      child: Stack(
                        children: [
                          Hero(
                            tag: 'product_image_${widget.productId ?? widget.title}',
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                              child: Image.network(
                                widget.imageUrl,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
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
                                    child: const Center(
                                      child: Icon(
                                        Icons.image_outlined,
                                        color: AppPalette.muted,
                                        size: 48,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          // Modern favorite button
                          Positioned(
                            top: 8,
                            right: 8,
                            child: GestureDetector(
                              onTap: _onFavoriteTap,
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: widget.isInWishlist == true 
                                      ? AppPalette.error 
                                      : Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.15),
                                      blurRadius: 6,
                                      offset: const Offset(0, 3),
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  widget.isInWishlist == true 
                                      ? Icons.favorite 
                                      : Icons.favorite_border,
                                  color: widget.isInWishlist == true 
                                      ? Colors.white 
                                      : AppPalette.textPrimary,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                          // Rating badge
                          if (widget.rating != null)
                            Positioned(
                              bottom: 8,
                              left: 8,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.1),
                                      blurRadius: 3,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: AppPalette.warning,
                                      size: 12,
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      widget.rating!.toStringAsFixed(1),
                                      style: AppTypography.bodySmall.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  // Content section - flexible and adaptive
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Brand and title - flexible
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (widget.brand != null)
                                  Text(
                                    widget.brand!,
                                    style: AppTypography.bodySmall.copyWith(
                                      color: AppPalette.muted,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 9,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                if (widget.brand != null)
                                  const SizedBox(height: 2),
                                Flexible(
                                  child: Text(
                                    widget.title,
                                    style: AppTypography.titleSmall.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      height: 1.1,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 4),
                          // Price and colors - fixed at bottom
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                widget.price,
                                style: AppTypography.titleMedium.copyWith(
                                  color: AppPalette.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 4),
                              // Modern color options
                              Row(
                                children: [
                                  ...widget.colors.take(3).map((color) => Container(
                                    width: 8,
                                    height: 8,
                                    margin: const EdgeInsets.only(right: 3),
                                    decoration: BoxDecoration(
                                      color: color,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 1,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withValues(alpha: 0.1),
                                          blurRadius: 1,
                                          offset: const Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                  )),
                                  if (widget.colors.length > 3)
                                    Container(
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: AppPalette.mutedLight,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppPalette.muted,
                                          width: 1,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          '+${widget.colors.length - 3}',
                                          style: AppTypography.bodySmall.copyWith(
                                            color: AppPalette.muted,
                                            fontSize: 6,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
