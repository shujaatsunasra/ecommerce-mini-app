import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../common/theme/app_theme.dart';
import '../../../../common/widgets/custom_app_bar.dart';
import '../widgets/enhanced_filter_bottom_sheet.dart';
import '../../domain/entities/product_filters.dart';
import 'enhanced_product_list_screen.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.2, 0.8, curve: Curves.easeOut),
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _showFilterBottomSheet() {
    HapticFeedback.mediumImpact();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => EnhancedFilterBottomSheet(
        currentFilters: ProductFilters(),
        onApplyFilters: (filters) {
          // TODO: Apply filters
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.background,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Column(
                  children: [
                    // Custom App Bar
                    CustomAppBar(
                      title: 'Products',
                      actions: [
                        IconButton(
                          onPressed: () {
                            HapticFeedback.selectionClick();
                            _showFilterBottomSheet();
                          },
                          icon: const Icon(Icons.tune),
                          color: AppPalette.textPrimary,
                        ),
                      ],
                    ),

                    // Products List
                    const Expanded(
                      child: EnhancedProductListScreen(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
