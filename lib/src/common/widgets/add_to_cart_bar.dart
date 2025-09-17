import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AddToCartBar extends StatelessWidget {
  final int quantity;
  final Function(int) onQuantityChanged;
  final VoidCallback onAddToCart;

  const AddToCartBar({
    super.key,
    required this.quantity,
    required this.onQuantityChanged,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: const BoxDecoration(
        color: AppPalette.textPrimary,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppRadius.xl),
        ),
      ),
      child: Row(
        children: [
          // Quantity selector
          Container(
            decoration: BoxDecoration(
              color: AppPalette.surfaceVariant,
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
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
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                  child: Text(
                    quantity.toString(),
                    style: AppTypography.titleMedium.copyWith(
                      color: AppPalette.textPrimary,
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
          ),
          const SizedBox(width: AppSpacing.lg),
          // Add to cart button
          Expanded(
            child: ElevatedButton(
              onPressed: onAddToCart,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppPalette.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                ),
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
              ),
              child: Text(
                'Add to Cart',
                style: AppTypography.titleMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
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
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppPalette.surfaceVariant,
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        child: Icon(
          icon,
          color: AppPalette.textPrimary,
          size: 20,
        ),
      ),
    );
  }
}
