import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

/// Global test configuration for the e-commerce app
class TestConfig {
  static const Duration defaultTimeout = Duration(seconds: 30);
  static const Duration shortTimeout = Duration(seconds: 5);
  static const Duration longTimeout = Duration(seconds: 60);

  /// Setup for widget tests that use network images
  static Future<void> setupNetworkImageMock() async {
    await mockNetworkImagesFor(() async {});
  }

  /// Common test data
  static const String testEmail = 'test@example.com';
  static const String testPassword = 'password123';
  static const String testName = 'Test User';
  static const String testProductTitle = 'Test Product';
  static const double testProductPrice = 29.99;
  static const String testProductImage = 'https://example.com/test-image.jpg';

  /// Test categories
  static const List<String> testCategories = [
    'electronics',
    'clothing',
    'beauty',
    'home',
    'sports',
  ];

  /// Test brands
  static const List<String> testBrands = [
    'Test Brand',
    'Sample Brand',
    'Demo Brand',
  ];

  /// Common test expectations
  static void expectLoadingState() {
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  }

  static void expectErrorState() {
    expect(find.textContaining('Error'), findsOneWidget);
  }

  static void expectSuccessState() {
    expect(find.byType(CircularProgressIndicator), findsNothing);
  }
}
