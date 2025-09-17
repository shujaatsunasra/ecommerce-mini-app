import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/theme/app_theme.dart';
import '../../../../common/widgets/custom_app_bar.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../../../auth/presentation/bloc/auth_event.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutCubic,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onBackPressed() {
    HapticFeedback.selectionClick();
    Navigator.pop(context);
  }

  void _onLogout() {
    HapticFeedback.mediumImpact();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
        title: const Text(
          'Logout',
          style: AppTypography.headlineSmall,
        ),
        content: const Text(
          'Are you sure you want to logout?',
          style: AppTypography.bodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(color: AppPalette.muted),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              context.read<AuthBloc>().add(const AuthEvent.logout());
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: AppPalette.primary),
            ),
          ),
        ],
      ),
    );
  }

  void _onMenuTap(String title) {
    HapticFeedback.selectionClick();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$title tapped'),
        backgroundColor: AppPalette.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.sm),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPalette.background,
      appBar: CustomAppBar(
        title: 'Profile',
        showBackButton: true,
        onBackPressed: _onBackPressed,
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (user) => FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: AppSpacing.lg),
                      
                      // Profile header
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                        padding: const EdgeInsets.all(AppSpacing.xl),
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
                        child: Column(
                          children: [
                            // Profile image
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: AppPalette.primary,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            const SizedBox(height: AppSpacing.md),
                            
                            // User info
                            Text(
                              user.firstName.isNotEmpty && user.lastName.isNotEmpty
                                  ? '${user.firstName} ${user.lastName}'
                                  : 'User',
                              style: AppTypography.headlineSmall,
                            ),
                            const SizedBox(height: AppSpacing.xs),
                            Text(
                              user.email,
                              style: AppTypography.bodyMedium.copyWith(
                                color: AppPalette.muted,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: AppSpacing.xl),

                      // Menu items
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
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
                        child: Column(
                          children: [
                            _buildMenuItem(
                              icon: Icons.person_outline,
                              title: 'Personal Information',
                              onTap: () => _onMenuTap('Personal Information'),
                            ),
                            _buildDivider(),
                            _buildMenuItem(
                              icon: Icons.shopping_bag_outlined,
                              title: 'My Orders',
                              onTap: () => _onMenuTap('My Orders'),
                            ),
                            _buildDivider(),
                            _buildMenuItem(
                              icon: Icons.favorite_outline,
                              title: 'Wishlist',
                              onTap: () => _onMenuTap('Wishlist'),
                            ),
                            _buildDivider(),
                            _buildMenuItem(
                              icon: Icons.location_on_outlined,
                              title: 'Addresses',
                              onTap: () => _onMenuTap('Addresses'),
                            ),
                            _buildDivider(),
                            _buildMenuItem(
                              icon: Icons.payment_outlined,
                              title: 'Payment Methods',
                              onTap: () => _onMenuTap('Payment Methods'),
                            ),
                            _buildDivider(),
                            _buildMenuItem(
                              icon: Icons.notifications_outlined,
                              title: 'Notifications',
                              onTap: () => _onMenuTap('Notifications'),
                            ),
                            _buildDivider(),
                            _buildMenuItem(
                              icon: Icons.help_outline,
                              title: 'Help & Support',
                              onTap: () => _onMenuTap('Help & Support'),
                            ),
                            _buildDivider(),
                            _buildMenuItem(
                              icon: Icons.logout,
                              title: 'Logout',
                              onTap: _onLogout,
                              isDestructive: true,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: AppSpacing.xl),
                    ],
                  ),
                ),
              ),
            ),
            error: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 80,
                    color: AppPalette.error,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    'Error loading profile',
                    style: AppTypography.headlineSmall.copyWith(
                      color: AppPalette.textPrimary,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    message,
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppPalette.muted,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: isDestructive ? Colors.red : AppPalette.primary,
                size: 24,
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text(
                  title,
                  style: AppTypography.bodyLarge.copyWith(
                    color: isDestructive ? Colors.red : AppPalette.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: AppPalette.muted,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: const EdgeInsets.only(left: 48),
      height: 1,
      color: AppPalette.mutedLight,
    );
  }
}
