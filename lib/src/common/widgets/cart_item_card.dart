import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CartItemCard extends StatelessWidget {
  final String title;
  final String category;
  final double price;
  final String imageUrl;
  final int quantity;
  final Function(int) onQuantityChanged;
  final VoidCallback onRemove;

  const CartItemCard({
    super.key,
    required this.title,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.quantity,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppPalette.surface,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Product image
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppPalette.surfaceVariant,
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.md),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppPalette.surfaceVariant,
                    child: const Icon(
                      Icons.image,
                      color: AppPalette.muted,
                      size: 30,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.lg),
          // Product details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  category,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppPalette.muted,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: AppTypography.titleMedium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                // Quantity selector
                Row(
                  children: [
                    _buildQuantityButton(
                      icon: Icons.remove,
                      onTap: () {
                        if (quantity > 1) {
                          onQuantityChanged(quantity - 1);
                        }
                      },
                    ),
                    Container(
                      width: 40,
                      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
                      child: Text(
                        quantity.toString(),
                        style: AppTypography.titleSmall.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    _buildQuantityButton(
                      icon: Icons.add,
                      onTap: () {
                        onQuantityChanged(quantity + 1);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Remove button
          GestureDetector(
            onTap: onRemove,
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: AppPalette.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppRadius.sm),
              ),
              child: const Icon(
                Icons.delete_outline,
                color: AppPalette.primary,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: AppPalette.surfaceVariant,
          borderRadius: BorderRadius.circular(AppRadius.sm),
        ),
        child: Icon(
          icon,
          color: AppPalette.textPrimary,
          size: 16,
        ),
      ),
    );
  }
}
