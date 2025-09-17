import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/theme/app_theme.dart';
import '../../../../common/widgets/custom_app_bar.dart';
import '../../../../common/widgets/custom_search_bar.dart';
import '../../../../common/widgets/promotional_banner.dart';
import '../../../../common/widgets/category_grid.dart';
import '../../../../common/widgets/product_grid.dart';
import '../../../product/presentation/bloc/product_list_bloc.dart';
import '../../../product/presentation/bloc/product_list_event.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _bannerController;
  late AnimationController _categoryController;
  late AnimationController _productController;
  late AnimationController _searchController;
  late AnimationController _appBarController;
  late AnimationController _entranceController;

  @override
  void initState() {
    super.initState();
    _entranceController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _appBarController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _searchController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _bannerController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _categoryController = AnimationController(
      duration: const Duration(milliseconds: 1400),
      vsync: this,
    );
    _productController = AnimationController(
      duration: const Duration(milliseconds: 1600),
      vsync: this,
    );

    // Start entrance animation
    _entranceController.forward();
    
    // Start staggered animations
    _appBarController.forward();
    Future.delayed(const Duration(milliseconds: 200), () {
      _searchController.forward();
    });
    Future.delayed(const Duration(milliseconds: 400), () {
      _bannerController.forward();
    });
    Future.delayed(const Duration(milliseconds: 600), () {
      _categoryController.forward();
    });
    Future.delayed(const Duration(milliseconds: 800), () {
      _productController.forward();
    });
    
    // Load products
    context.read<ProductListBloc>().add(const ProductListEvent.loadProducts());
  }

  @override
  void dispose() {
    _entranceController.dispose();
    _appBarController.dispose();
    _searchController.dispose();
    _bannerController.dispose();
    _categoryController.dispose();
    _productController.dispose();
    super.dispose();
  }

  void _showCategoriesBottomSheet() {
    HapticFeedback.mediumImpact();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: const BoxDecoration(
          color: AppPalette.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
        ),
        child: Column(
          children: [
            // Handle bar
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.symmetric(vertical: AppSpacing.md),
              decoration: BoxDecoration(
                color: AppPalette.mutedLight,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Row(
                children: [
                  Text(
                    'Categories',
                    style: AppTypography.titleLarge.copyWith(
                      color: AppPalette.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            // Categories content
            const Expanded(child: CategoryGrid()),
          ],
        ),
      ),
    );
  }

  void _onProductTap() {
    HapticFeedback.selectionClick();
    Navigator.of(context).pushNamed(
      '/product-detail',
      arguments: {
        'productId': '1',
        'title': 'Wireless Headphones',
        'price': '\$120.00',
        'imageUrl': 'https://via.placeholder.com/300x300/FF6B35/FFFFFF?text=Headphones',
        'rating': 4.8,
        'reviewCount': 320,
        'seller': 'Tariqul Islam',
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.background,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _entranceController,
          builder: (context, child) {
            return FadeTransition(
              opacity: _entranceController,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.1),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: _entranceController,
                  curve: Curves.easeOutCubic,
                )),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Custom App Bar with animation
                      AnimatedBuilder(
                        animation: _appBarController,
                        builder: (context, child) {
                          return FadeTransition(
                            opacity: _appBarController,
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, -0.3),
                                end: Offset.zero,
                              ).animate(CurvedAnimation(
                                parent: _appBarController,
                                curve: Curves.easeOutBack,
                              )),
                              child: CustomAppBar(
                                title: 'E-Commerce',
                                actions: [
                                  IconButton(
                                    onPressed: () {
                                      HapticFeedback.selectionClick();
                                      _showCategoriesBottomSheet();
                                    },
                                    icon: const Icon(Icons.grid_view_outlined),
                                    color: AppPalette.textPrimary,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      HapticFeedback.selectionClick();
                                      // TODO: Implement notifications
                                    },
                                    icon: const Icon(Icons.notifications_outlined),
                                    color: AppPalette.textPrimary,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),

                      // Search Bar with animation
                      AnimatedBuilder(
                        animation: _searchController,
                        builder: (context, child) {
                          return FadeTransition(
                            opacity: _searchController,
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, 0.2),
                                end: Offset.zero,
                              ).animate(CurvedAnimation(
                                parent: _searchController,
                                curve: Curves.easeOutCubic,
                              )),
                              child: Padding(
                                padding: const EdgeInsets.all(AppSpacing.lg),
                                child: CustomSearchBar(),
                              ),
                            ),
                          );
                        },
                      ),

                      // Promotional Banner
                      AnimatedBuilder(
                        animation: _bannerController,
                        builder: (context, child) {
                          return FadeTransition(
                            opacity: _bannerController,
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, 0.3),
                                end: Offset.zero,
                              ).animate(CurvedAnimation(
                                parent: _bannerController,
                                curve: Curves.easeOut,
                              )),
                              child: const PromotionalBanner(),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: AppSpacing.xl),

                      // Featured Products Section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Featured Products',
                              style: AppTypography.titleLarge.copyWith(
                                color: AppPalette.textPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                HapticFeedback.selectionClick();
                                Navigator.pushNamed(context, '/products');
                              },
                              child: Text(
                                'See All',
                                style: AppTypography.bodyMedium.copyWith(
                                  color: AppPalette.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: AppSpacing.md),

                      // Featured Products Grid
                      AnimatedBuilder(
                        animation: _productController,
                        builder: (context, child) {
                          return FadeTransition(
                            opacity: _productController,
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, 0.3),
                                end: Offset.zero,
                              ).animate(CurvedAnimation(
                                parent: _productController,
                                curve: Curves.easeOut,
                              )),
                              child: ProductGrid(
                                onProductTap: _onProductTap,
                                showHeader: false,
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: AppSpacing.xl),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
