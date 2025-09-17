import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ecommerce_mini_app/src/features/product/domain/entities/product.dart';
import 'package:ecommerce_mini_app/src/features/cart/domain/entities/cart_item.dart';
import 'package:ecommerce_mini_app/src/features/cart/domain/entities/cart.dart';
import 'package:ecommerce_mini_app/src/features/wishlist/domain/entities/wishlist.dart';
import 'package:ecommerce_mini_app/src/features/auth/domain/entities/user.dart';

/// Test helper utilities for the e-commerce app
class TestHelpers {
  /// Creates a test product with default values
  static Product createTestProduct({
    int id = 1,
    String title = 'Test Product',
    String description = 'Test Description',
    double price = 29.99,
    double discountPercentage = 10.0,
    double rating = 4.5,
    int stock = 100,
    String brand = 'Test Brand',
    String category = 'electronics',
    String thumbnail = 'https://example.com/image.jpg',
    List<String> images = const ['https://example.com/image.jpg'],
  }) {
    return Product(
      id: id,
      title: title,
      description: description,
      price: price,
      discountPercentage: discountPercentage,
      rating: rating,
      stock: stock,
      brand: brand,
      category: category,
      thumbnail: thumbnail,
      images: images,
    );
  }

  /// Creates a test user with default values
  static User createTestUser({
    int id = 1,
    String email = 'test@example.com',
    String name = 'Test User',
    String username = 'testuser',
    String phone = '+1234567890',
  }) {
    return User(
      id: id,
      email: email,
      name: name,
      username: username,
      phone: phone,
      address: Address(
        address: '123 Test St',
        city: 'Test City',
        coordinates: Coordinates(lat: 40.7128, lng: -74.0060),
        postalCode: '12345',
        state: 'Test State',
      ),
    );
  }

  /// Creates a test cart item
  static CartItem createTestCartItem({
    Product? product,
    int quantity = 1,
  }) {
    return CartItem(
      product: product ?? createTestProduct(),
      quantity: quantity,
    );
  }

  /// Creates a test cart
  static Cart createTestCart({
    List<CartItem> items = const [],
  }) {
    return Cart(items: items);
  }

  /// Creates a test wishlist
  static Wishlist createTestWishlist({
    List<Product> products = const [],
  }) {
    return Wishlist(products: products);
  }

  /// Waits for a widget to appear with timeout
  static Future<void> waitForWidget(
    WidgetTester tester,
    Finder finder, {
    Duration timeout = const Duration(seconds: 5),
  }) async {
    final end = DateTime.now().add(timeout);
    while (DateTime.now().isBefore(end)) {
      await tester.pump();
      if (finder.evaluate().isNotEmpty) {
        return;
      }
      await Future.delayed(const Duration(milliseconds: 100));
    }
    throw TimeoutException('Widget not found within timeout', timeout);
  }

  /// Waits for a widget to disappear with timeout
  static Future<void> waitForWidgetToDisappear(
    WidgetTester tester,
    Finder finder, {
    Duration timeout = const Duration(seconds: 5),
  }) async {
    final end = DateTime.now().add(timeout);
    while (DateTime.now().isBefore(end)) {
      await tester.pump();
      if (finder.evaluate().isEmpty) {
        return;
      }
      await Future.delayed(const Duration(milliseconds: 100));
    }
    throw TimeoutException('Widget still present after timeout', timeout);
  }

  /// Pumps and settles with custom duration
  static Future<void> pumpAndSettle(
    WidgetTester tester, {
    Duration duration = const Duration(seconds: 1),
  }) async {
    await tester.pumpAndSettle(duration);
  }

  /// Finds a widget by text and taps it
  static Future<void> tapByText(
    WidgetTester tester,
    String text, {
    bool skipOffstage = true,
  }) async {
    await tester.tap(find.text(text), skipOffstage: skipOffstage);
    await tester.pumpAndSettle();
  }

  /// Finds a widget by icon and taps it
  static Future<void> tapByIcon(
    WidgetTester tester,
    IconData icon, {
    bool skipOffstage = true,
  }) async {
    await tester.tap(find.byIcon(icon), skipOffstage: skipOffstage);
    await tester.pumpAndSettle();
  }

  /// Enters text into a text field
  static Future<void> enterText(
    WidgetTester tester,
    String text, {
    Finder? finder,
  }) async {
    final textField = finder ?? find.byType(TextField);
    await tester.enterText(textField.first, text);
    await tester.pumpAndSettle();
  }

  /// Verifies that a snackbar is displayed
  static void expectSnackBar(String message) {
    expect(find.text(message), findsOneWidget);
  }

  /// Verifies that a loading indicator is shown
  static void expectLoadingIndicator() {
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  }

  /// Verifies that no loading indicator is shown
  static void expectNoLoadingIndicator() {
    expect(find.byType(CircularProgressIndicator), findsNothing);
  }

  /// Verifies that an error message is displayed
  static void expectErrorMessage() {
    expect(find.textContaining('Error'), findsOneWidget);
  }

  /// Verifies that a success message is displayed
  static void expectSuccessMessage() {
    expect(find.textContaining('Success'), findsOneWidget);
  }

  /// Common test data sets
  static List<Product> getTestProducts() {
    return [
      createTestProduct(id: 1, title: 'Product 1', price: 29.99),
      createTestProduct(id: 2, title: 'Product 2', price: 49.99),
      createTestProduct(id: 3, title: 'Product 3', price: 19.99),
    ];
  }

  static List<String> getTestCategories() {
    return ['electronics', 'clothing', 'beauty', 'home', 'sports'];
  }

  static List<String> getTestBrands() {
    return ['Brand A', 'Brand B', 'Brand C', 'Brand D'];
  }
}
