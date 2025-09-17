import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../theme/app_theme.dart';

class ShimmerPlaceholder extends StatelessWidget {
  final double? width;
  final double? height;
  final double borderRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const ShimmerPlaceholder({
    super.key,
    this.width,
    this.height,
    this.borderRadius = AppRadius.md,
    this.margin,
    this.padding,
  });

  const ShimmerPlaceholder.rectangular({
    super.key,
    this.width,
    this.height,
    this.borderRadius = AppRadius.md,
    this.margin,
    this.padding,
  });

  const ShimmerPlaceholder.circular({
    super.key,
    required double size,
    this.margin,
    this.padding,
  }) : width = size,
       height = size,
       borderRadius = size / 2;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      child: Shimmer.fromColors(
        baseColor: isDark ? AppPalette.darkMuted : AppPalette.mutedLight,
        highlightColor: isDark ? AppPalette.darkMutedLight : AppPalette.muted,
        child: Container(
          decoration: BoxDecoration(
            color: isDark ? AppPalette.darkMuted : AppPalette.mutedLight,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}

class ShimmerProductCard extends StatelessWidget {
  const ShimmerProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image placeholder
          const Expanded(
            flex: 7,
            child: ShimmerPlaceholder(
              borderRadius: 0,
            ),
          ),
          // Content placeholder - ultra compact
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title placeholder
                  const ShimmerPlaceholder(
                    height: 4,
                    width: double.infinity,
                  ),
                  // Brand placeholder
                  const ShimmerPlaceholder(
                    height: 3,
                    width: 40,
                  ),
                  const Spacer(),
                  // Price and rating row
                  Row(
                    children: [
                      const ShimmerPlaceholder(
                        height: 3,
                        width: 30,
                      ),
                      const Spacer(),
                      const ShimmerPlaceholder(
                        height: 3,
                        width: 12,
                      ),
                    ],
                  ),
                  // Add to cart button placeholder
                  const ShimmerPlaceholder(
                    height: 8,
                    width: 20,
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

class ShimmerCartItem extends StatelessWidget {
  const ShimmerCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            // Image placeholder
            const ShimmerPlaceholder(
              width: 80,
              height: 80,
              borderRadius: AppRadius.sm,
            ),
            const SizedBox(width: AppSpacing.md),
            // Content placeholder
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ShimmerPlaceholder(
                    height: 16,
                    width: double.infinity,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  const ShimmerPlaceholder(
                    height: 12,
                    width: 100,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  const ShimmerPlaceholder(
                    height: 14,
                    width: 80,
                  ),
                ],
              ),
            ),
            // Action buttons placeholder
            const Column(
              children: [
                ShimmerPlaceholder(
                  width: 80,
                  height: 32,
                  borderRadius: AppRadius.sm,
                ),
                SizedBox(height: AppSpacing.sm),
                ShimmerPlaceholder(
                  width: 24,
                  height: 24,
                  borderRadius: 12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
