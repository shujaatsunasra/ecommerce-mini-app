import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CheckoutSection extends StatelessWidget {
  final double subtotal;
  final VoidCallback onCheckout;

  const CheckoutSection({
    super.key,
    required this.subtotal,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: const BoxDecoration(
        color: AppPalette.surface,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppRadius.xl),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Discount code input
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            decoration: BoxDecoration(
              color: AppPalette.surfaceVariant,
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter Discount Code',
                hintStyle: AppTypography.bodyMedium.copyWith(
                  color: AppPalette.muted,
                ),
                border: InputBorder.none,
                suffixIcon: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Apply',
                    style: TextStyle(
                      color: AppPalette.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          // Order summary
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal',
                style: AppTypography.titleMedium.copyWith(
                  color: AppPalette.muted,
                ),
              ),
              Text(
                '\$${subtotal.toStringAsFixed(2)}',
                style: AppTypography.titleMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: AppTypography.titleLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$${subtotal.toStringAsFixed(2)}',
                style: AppTypography.titleLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          // Checkout button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onCheckout,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppPalette.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                ),
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
              ),
              child: Text(
                'Checkout',
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
}
