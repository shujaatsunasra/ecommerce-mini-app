import 'package:flutter/material.dart';
import '../../domain/entities/cart_item.dart';
import '../../../../common/widgets/image_helper.dart';
import '../../../../common/widgets/shimmer_placeholder.dart';
import '../../../../common/theme/app_theme.dart';
import '../widgets/quantity_selector.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final Function(int) onQuantityChanged;
  final VoidCallback onRemove;

  const CartItemWidget({
    super.key,
    required this.item,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final product = item.product;

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            // Product Image
            ImageHelper.cachedImage(
              imageUrl: product.thumbnail ?? '',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(AppRadius.sm),
              placeholder: const ShimmerPlaceholder(
                width: 80,
                height: 80,
                borderRadius: AppRadius.sm,
              ),
            ),
            const SizedBox(width: AppSpacing.md),

            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    product.displayBrand,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Row(
                    children: [
                      Text(
                        product.formattedPrice,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppPalette.primary,
                        ),
                      ),
                      if (product.hasDiscount) ...[
                        const SizedBox(width: AppSpacing.sm),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.xs,
                            vertical: AppSpacing.xs,
                          ),
                          decoration: BoxDecoration(
                            color: AppPalette.error.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(AppRadius.sm),
                          ),
                          child: Text(
                            '-${product.discountPercentage.toInt()}%',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: AppPalette.error,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),

            // Quantity and Remove
            Column(
              children: [
                QuantitySelector(
                  quantity: item.quantity,
                  onQuantityChanged: onQuantityChanged,
                  minQuantity: 1,
                  maxQuantity: product.stock,
                ),
                const SizedBox(height: AppSpacing.sm),
                IconButton(
                  onPressed: onRemove,
                  icon: const Icon(Icons.delete_outline),
                  color: AppPalette.error,
                  tooltip: 'Remove item',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
