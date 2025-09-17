import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    this.title,
    this.showBackButton = false,
    this.onBackPressed,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppPalette.surface,
      elevation: 0,
      leading: showBackButton
          ? Container(
              margin: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: AppPalette.surfaceVariant,
                borderRadius: BorderRadius.circular(AppRadius.sm),
              ),
              child: IconButton(
                onPressed: onBackPressed ?? () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppPalette.textPrimary,
                  size: 20,
                ),
              ),
            )
          : Container(
              margin: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: AppPalette.surfaceVariant,
                borderRadius: BorderRadius.circular(AppRadius.sm),
              ),
              child: IconButton(
                onPressed: () {
                  HapticFeedback.selectionClick();
                },
                icon: const Icon(
                  Icons.grid_view,
                  color: AppPalette.textPrimary,
                  size: 20,
                ),
              ),
            ),
      title: title != null
          ? Text(
              title!,
              style: AppTypography.headlineSmall.copyWith(
                fontWeight: FontWeight.bold,
              ),
            )
          : null,
      centerTitle: true,
      actions: actions ??
          [
            Container(
              margin: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: AppPalette.surfaceVariant,
                borderRadius: BorderRadius.circular(AppRadius.sm),
              ),
              child: IconButton(
                onPressed: () {
                  HapticFeedback.selectionClick();
                },
                icon: const Icon(
                  Icons.notifications_outlined,
                  color: AppPalette.textPrimary,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.md),
          ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
