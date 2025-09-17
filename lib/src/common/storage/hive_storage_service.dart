import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import '../../features/product/domain/entities/product.dart';
import '../../features/cart/domain/entities/cart.dart';
import '../../features/wishlist/domain/entities/wishlist.dart';

@singleton
class HiveStorageService {
  static const String _productsBox = 'products';
  static const String _cartBox = 'cart';
  static const String _wishlistBox = 'wishlist';
  static const String _cacheMetadataBox = 'cache_metadata';

  Future<void> init() async {
    await Hive.initFlutter();
    
    // Note: Adapters will be registered when needed
  }

  // Products cache
  Future<void> cacheProducts(List<Product> products) async {
    final box = await Hive.openBox<Product>(_productsBox);
    await box.clear();
    
    // Add products with cache timestamp
    final productsWithTimestamp = products.map((product) => product.copyWith(
      cachedAt: DateTime.now(),
    )).toList();
    
    for (final product in productsWithTimestamp) {
      await box.put(product.id, product);
    }
    
    // Update cache metadata
    await _updateCacheMetadata('products', DateTime.now());
  }

  Future<List<Product>> getCachedProducts() async {
    final box = await Hive.openBox<Product>(_productsBox);
    return box.values.toList();
  }

  Future<void> cacheProduct(Product product) async {
    final box = await Hive.openBox<Product>(_productsBox);
    final productWithTimestamp = product.copyWith(
      cachedAt: DateTime.now(),
    );
    await box.put(product.id, productWithTimestamp);
  }

  Future<Product?> getCachedProduct(int id) async {
    final box = await Hive.openBox<Product>(_productsBox);
    return box.get(id);
  }

  Future<void> clearProductCache() async {
    final box = await Hive.openBox<Product>(_productsBox);
    await box.clear();
    await _updateCacheMetadata('products', null);
  }


  // Cache metadata
  Future<DateTime?> getCacheTimestamp() async {
    final box = await Hive.openBox<DateTime>(_cacheMetadataBox);
    return box.get('products');
  }

  Future<void> _updateCacheMetadata(String key, DateTime? timestamp) async {
    final box = await Hive.openBox<DateTime>(_cacheMetadataBox);
    if (timestamp != null) {
      await box.put(key, timestamp);
    } else {
      await box.delete(key);
    }
  }

  // Cart persistence
  Future<void> saveCart(Cart cart) async {
    final box = await Hive.openBox<String>(_cartBox);
    final cartJson = cart.toJson();
    await box.put('cart', jsonEncode(cartJson));
  }

  Future<Cart> getCart() async {
    final box = await Hive.openBox<String>(_cartBox);
    final cartJsonString = box.get('cart');
    if (cartJsonString == null) {
      return const Cart();
    }
    try {
      final cartJson = jsonDecode(cartJsonString) as Map<String, dynamic>;
      return Cart.fromJson(cartJson);
    } catch (e) {
      return const Cart();
    }
  }

  // Wishlist persistence
  Future<void> saveWishlist(Wishlist wishlist) async {
    final box = await Hive.openBox<String>(_wishlistBox);
    final wishlistJson = wishlist.toJson();
    await box.put('wishlist', jsonEncode(wishlistJson));
  }

  Future<Wishlist> getWishlist() async {
    final box = await Hive.openBox<String>(_wishlistBox);
    final wishlistJsonString = box.get('wishlist');
    if (wishlistJsonString == null) {
      return const Wishlist();
    }
    try {
      final wishlistJson = jsonDecode(wishlistJsonString) as Map<String, dynamic>;
      return Wishlist.fromJson(wishlistJson);
    } catch (e) {
      return const Wishlist();
    }
  }

  Future<void> clearAll() async {
    await Hive.deleteBoxFromDisk(_productsBox);
    await Hive.deleteBoxFromDisk(_cartBox);
    await Hive.deleteBoxFromDisk(_wishlistBox);
  }
}
