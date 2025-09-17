import 'package:flutter/material.dart';
import '../../../product/domain/entities/product.dart';
import '../../../../common/widgets/product_card.dart';

class WishlistItemWidget extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;
  final VoidCallback? onAddToCart;
  final VoidCallback? onRemove;

  const WishlistItemWidget({
    super.key,
    required this.product,
    this.onTap,
    this.onAddToCart,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return ProductCard(
      title: product.title,
      price: '\$${product.price.toStringAsFixed(2)}',
      imageUrl: product.thumbnail ?? 'https://via.placeholder.com/150x150/FF6B35/FFFFFF?text=Product',
      colors: [Colors.black, Colors.blue, Colors.orange],
      onTap: onTap ?? () {},
      onFavorite: onRemove ?? () {}, // Remove from wishlist
    );
  }
}
