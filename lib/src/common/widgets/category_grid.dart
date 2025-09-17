import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_theme.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Text(
            'Categories',
            style: AppTypography.headlineSmall,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              final category = _categories[index];
              return _CategoryItem(
                name: category['name']!,
                icon: category['icon']!,
                color: category['color']!,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CategoryItem extends StatefulWidget {
  final String name;
  final IconData icon;
  final Color color;

  const _CategoryItem({
    required this.name,
    required this.icon,
    required this.color,
  });

  @override
  State<_CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<_CategoryItem> with SingleTickerProviderStateMixin {
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
      end: 0.9,
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

  void _onTap() {
    HapticFeedback.selectionClick();
    _animationController.forward().then((_) {
      _animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              width: 80,
              margin: const EdgeInsets.only(right: AppSpacing.lg),
              child: Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: widget.color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(AppRadius.lg),
                    ),
                    child: Icon(
                      widget.icon,
                      color: widget.color,
                      size: 28,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    widget.name,
                    style: AppTypography.labelMedium,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

final List<Map<String, dynamic>> _categories = [
  {
    'name': 'Shoes',
    'icon': Icons.sports_soccer,
    'color': AppPalette.primary,
  },
  {
    'name': 'Beauty',
    'icon': Icons.face,
    'color': AppPalette.accent,
  },
  {
    'name': 'Women\'s Fashion',
    'icon': Icons.woman,
    'color': AppPalette.warning,
  },
  {
    'name': 'Jewelry',
    'icon': Icons.diamond,
    'color': AppPalette.info,
  },
  {
    'name': 'Men\'s Fashion',
    'icon': Icons.man,
    'color': AppPalette.success,
  },
  {
    'name': 'Electronics',
    'icon': Icons.phone_android,
    'color': AppPalette.error,
  },
];
