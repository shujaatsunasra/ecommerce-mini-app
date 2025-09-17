import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProductInfoSection extends StatelessWidget {
  final String title;
  final String price;
  final double rating;
  final int reviewCount;
  final String seller;
  final List<Color> colors;
  final int selectedColorIndex;
  final Function(int) onColorSelected;

  const ProductInfoSection({
    super.key,
    required this.title,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.seller,
    required this.colors,
    required this.selectedColorIndex,
    required this.onColorSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            title,
            style: AppTypography.headlineSmall.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          // Price and rating row
          Row(
            children: [
              // Rating
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: AppPalette.primary,
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      rating.toStringAsFixed(1),
                      style: AppTypography.labelMedium.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                '($reviewCount Review)',
                style: AppTypography.bodySmall.copyWith(
                  color: AppPalette.muted,
                ),
              ),
              const Spacer(),
              // Price
              Text(
                price,
                style: AppTypography.headlineSmall.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          // Seller info
          Text(
            'Seller: $seller',
            style: AppTypography.bodySmall.copyWith(
              color: AppPalette.muted,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          // Color selection
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Color',
                style: AppTypography.titleMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: colors.asMap().entries.map((entry) {
                  final index = entry.key;
                  final color = entry.value;
                  final isSelected = index == selectedColorIndex;
                  
                  return GestureDetector(
                    onTap: () => onColorSelected(index),
                    child: Container(
                      width: 32,
                      height: 32,
                      margin: const EdgeInsets.only(right: AppSpacing.sm),
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected ? AppPalette.primary : AppPalette.mutedLight,
                          width: isSelected ? 3 : 1,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
