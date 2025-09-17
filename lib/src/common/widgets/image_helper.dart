import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import '../theme/app_theme.dart';
import 'shimmer_placeholder.dart';

class ImageHelper {
  static Widget cachedImage({
    required String imageUrl,
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
    BorderRadius? borderRadius,
    Widget? placeholder,
    Widget? errorWidget,
    String? heroTag,
  }) {
    final imageWidget = CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => placeholder ?? 
        ShimmerPlaceholder(
          width: width,
          height: height,
          borderRadius: borderRadius?.topLeft.x ?? AppRadius.md,
        ),
      errorWidget: (context, url, error) => errorWidget ?? 
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: AppPalette.mutedLight,
            borderRadius: borderRadius,
          ),
          child: const Icon(
            Icons.broken_image,
            color: AppPalette.muted,
            size: 32,
          ),
        ),
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
    );

    if (heroTag != null) {
      return Hero(
        tag: heroTag,
        child: imageWidget,
      );
    }

    return imageWidget;
  }

  static Future<void> preloadImage(
    BuildContext context,
    String imageUrl,
  ) async {
    try {
      await precacheImage(
        CachedNetworkImageProvider(imageUrl),
        context,
      );
    } catch (e) {
      // Silently handle preload errors
      debugPrint('Failed to preload image: $e');
    }
  }

  static Widget productImage({
    required String imageUrl,
    required double width,
    required double height,
    String? heroTag,
    BorderRadius? borderRadius,
  }) {
    return cachedImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: BoxFit.cover,
      borderRadius: borderRadius ?? BorderRadius.circular(AppRadius.lg),
      heroTag: heroTag,
      placeholder: ShimmerPlaceholder(
        width: width,
        height: height,
        borderRadius: borderRadius?.topLeft.x ?? AppRadius.lg,
      ),
    );
  }

  static Widget avatarImage({
    required String imageUrl,
    required double size,
    String? heroTag,
  }) {
    return cachedImage(
      imageUrl: imageUrl,
      width: size,
      height: size,
      fit: BoxFit.cover,
      borderRadius: BorderRadius.circular(size / 2),
      heroTag: heroTag,
      placeholder: ShimmerPlaceholder.circular(size: size),
    );
  }
}

class OptimizedImage extends StatefulWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final String? heroTag;
  final VoidCallback? onTap;
  final Widget? placeholder;
  final Widget? errorWidget;

  const OptimizedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.heroTag,
    this.onTap,
    this.placeholder,
    this.errorWidget,
  });

  @override
  State<OptimizedImage> createState() => _OptimizedImageState();
}

class _OptimizedImageState extends State<OptimizedImage> {
  @override
  void initState() {
    super.initState();
    // Preload image for better performance
    if (widget.imageUrl.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ImageHelper.preloadImage(context, widget.imageUrl);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget imageWidget = ImageHelper.cachedImage(
      imageUrl: widget.imageUrl,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
      borderRadius: widget.borderRadius,
      heroTag: widget.heroTag,
      placeholder: widget.placeholder,
      errorWidget: widget.errorWidget,
    );

    if (widget.onTap != null) {
      imageWidget = GestureDetector(
        onTap: () {
          HapticFeedback.selectionClick();
          widget.onTap!();
        },
        child: imageWidget,
      );
    }

    return imageWidget;
  }
}
