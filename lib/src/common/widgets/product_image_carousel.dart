import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProductImageCarousel extends StatefulWidget {
  final String imageUrl;
  final Function(int) onImageChanged;

  const ProductImageCarousel({
    super.key,
    required this.imageUrl,
    required this.onImageChanged,
  });

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
              widget.onImageChanged(index);
            },
            itemCount: 4, // Assuming 4 images
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppPalette.surfaceVariant,
                ),
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppPalette.surfaceVariant,
                      child: const Icon(
                        Icons.image,
                        color: AppPalette.muted,
                        size: 80,
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
        // Page indicators
        Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              return Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: index == _currentIndex
                      ? AppPalette.primary
                      : AppPalette.mutedLight,
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
