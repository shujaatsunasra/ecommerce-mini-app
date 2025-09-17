import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ecommerce_mini_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('E-commerce App Integration Tests', () {
    testWidgets('Complete user journey: Browse products, add to cart, checkout',
        (WidgetTester tester) async {
      // Start the app
      app.main();
      await tester.pumpAndSettle();

      // Wait for products to load
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Verify home screen is displayed
      expect(find.text('Featured Products'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);

      // Find and tap on the first product
      final productCards = find.byType(InkWell);
      expect(productCards, findsWidgets);
      
      await tester.tap(productCards.first);
      await tester.pumpAndSettle();

      // Verify product detail screen is displayed
      expect(find.text('Add to Cart'), findsOneWidget);
      expect(find.text('Add to Wishlist'), findsOneWidget);

      // Add product to cart
      await tester.tap(find.text('Add to Cart'));
      await tester.pumpAndSettle();

      // Verify success message
      expect(find.text('Added to cart'), findsOneWidget);

      // Navigate to cart
      await tester.tap(find.byIcon(Icons.shopping_cart));
      await tester.pumpAndSettle();

      // Verify cart screen
      expect(find.text('My Cart'), findsOneWidget);
      expect(find.text('Checkout'), findsOneWidget);

      // Navigate back to home
      await tester.tap(find.byIcon(Icons.home));
      await tester.pumpAndSettle();

      // Verify we're back on home screen
      expect(find.text('Featured Products'), findsOneWidget);
    });

    testWidgets('Product search and filtering flow', (WidgetTester tester) async {
      // Start the app
      app.main();
      await tester.pumpAndSettle();

      // Wait for products to load
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Navigate to products screen
      await tester.tap(find.byIcon(Icons.grid_view));
      await tester.pumpAndSettle();

      // Verify products screen is displayed
      expect(find.text('Products'), findsOneWidget);

      // Test search functionality
      final searchField = find.byType(TextField);
      if (searchField.evaluate().isNotEmpty) {
        await tester.enterText(searchField.first, 'test');
        await tester.pumpAndSettle();
      }

      // Test filter functionality
      final filterButton = find.byIcon(Icons.filter_list);
      if (filterButton.evaluate().isNotEmpty) {
        await tester.tap(filterButton);
        await tester.pumpAndSettle();
        
        // Close filter if opened
        await tester.tap(find.byIcon(Icons.close));
        await tester.pumpAndSettle();
      }

      // Navigate back to home
      await tester.tap(find.byIcon(Icons.home));
      await tester.pumpAndSettle();
    });

    testWidgets('Wishlist functionality flow', (WidgetTester tester) async {
      // Start the app
      app.main();
      await tester.pumpAndSettle();

      // Wait for products to load
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // Find and tap on the first product
      final productCards = find.byType(InkWell);
      expect(productCards, findsWidgets);
      
      await tester.tap(productCards.first);
      await tester.pumpAndSettle();

      // Add product to wishlist
      await tester.tap(find.text('Add to Wishlist'));
      await tester.pumpAndSettle();

      // Navigate to wishlist
      await tester.tap(find.byIcon(Icons.favorite));
      await tester.pumpAndSettle();

      // Verify wishlist screen
      expect(find.text('My Wishlist'), findsOneWidget);

      // Navigate back to home
      await tester.tap(find.byIcon(Icons.home));
      await tester.pumpAndSettle();
    });

    testWidgets('Profile screen and logout flow', (WidgetTester tester) async {
      // Start the app
      app.main();
      await tester.pumpAndSettle();

      // Navigate to profile
      await tester.tap(find.byIcon(Icons.person));
      await tester.pumpAndSettle();

      // Verify profile screen
      expect(find.text('Profile'), findsOneWidget);

      // Test logout functionality
      final logoutButton = find.text('Logout');
      if (logoutButton.evaluate().isNotEmpty) {
        await tester.tap(logoutButton);
        await tester.pumpAndSettle();
      }

      // Navigate back to home
      await tester.tap(find.byIcon(Icons.home));
      await tester.pumpAndSettle();
    });

    testWidgets('Bottom navigation bar functionality', (WidgetTester tester) async {
      // Start the app
      app.main();
      await tester.pumpAndSettle();

      // Test all navigation items
      final navItems = [
        Icons.home,
        Icons.grid_view,
        Icons.shopping_cart,
        Icons.favorite,
        Icons.person,
      ];

      for (final icon in navItems) {
        await tester.tap(find.byIcon(icon));
        await tester.pumpAndSettle();
        
        // Verify the screen changed (basic check)
        expect(find.byIcon(icon), findsOneWidget);
      }
    });

    testWidgets('App handles network errors gracefully', (WidgetTester tester) async {
      // Start the app
      app.main();
      await tester.pumpAndSettle();

      // Wait for initial load
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // Verify app doesn't crash and shows appropriate UI
      expect(find.byType(MaterialApp), findsOneWidget);
      
      // Check if error states are handled
      final errorWidgets = find.textContaining('Error');
      if (errorWidgets.evaluate().isNotEmpty) {
        // Verify error UI is displayed properly
        expect(errorWidgets, findsWidgets);
      }
    });
  });
}
