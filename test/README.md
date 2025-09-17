# 🧪 E-commerce Mini App Test Suite

This directory contains comprehensive tests for the e-commerce mini app, including unit tests, integration tests, and widget tests.

## 📁 Directory Structure

```
test/
├── unit/                    # Unit tests
│   ├── bloc/               # BLoC tests
│   │   ├── cart_bloc_test.dart
│   │   ├── wishlist_bloc_test.dart
│   │   └── auth_bloc_test.dart
│   ├── repository/         # Repository tests
│   └── usecase/           # Use case tests
├── integration/            # Integration tests
│   └── app_test.dart      # End-to-end user flow tests
├── mocks/                 # Mock objects
├── test_config.dart       # Test configuration
├── test_helpers.dart      # Test utility functions
├── run_tests.dart         # Test runner script
└── README.md             # This file
```

## 🚀 Running Tests

### Run All Tests
```bash
dart test/run_tests.dart
```

### Run Specific Test Categories
```bash
# Unit tests only
flutter test test/unit/

# Integration tests only
flutter test test/integration/

# Widget tests only
flutter test test/widget_test.dart
```

### Run Tests with Coverage
```bash
flutter test --coverage
```

### Run Tests in Watch Mode
```bash
flutter test --watch
```

## 📋 Test Categories

### 1. Unit Tests (`test/unit/`)

#### BLoC Tests
- **CartBloc**: Tests cart operations (add, remove, update, clear)
- **WishlistBloc**: Tests wishlist operations (add, remove, toggle, clear)
- **AuthBloc**: Tests authentication flows (login, register, logout)

#### Repository Tests
- Tests data layer implementations
- Tests API integration
- Tests error handling

#### Use Case Tests
- Tests business logic
- Tests data transformation
- Tests validation

### 2. Integration Tests (`test/integration/`)

#### End-to-End User Flows
- **Complete Shopping Journey**: Browse → Add to Cart → Checkout
- **Product Search & Filtering**: Search products and apply filters
- **Wishlist Management**: Add/remove items from wishlist
- **User Authentication**: Login/logout flow
- **Navigation**: Bottom navigation bar functionality
- **Error Handling**: Network errors and edge cases

### 3. Widget Tests (`test/widget_test.dart`)

#### UI Component Testing
- Individual widget testing
- User interaction testing
- State management testing
- Responsive design testing

## 🛠️ Test Utilities

### TestConfig (`test_config.dart`)
- Global test configuration
- Common test data
- Timeout settings
- Test expectations

### TestHelpers (`test_helpers.dart`)
- Helper functions for creating test data
- Widget interaction utilities
- Common assertions
- Test data generators

## 📊 Test Coverage

The test suite aims for:
- **Unit Tests**: 90%+ coverage
- **Integration Tests**: Cover all major user flows
- **Widget Tests**: Cover all UI components

### Coverage Reports
```bash
# Generate coverage report
flutter test --coverage

# View coverage report
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

## 🔧 Test Configuration

### Dependencies
```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  bloc_test: ^9.1.7
  mockito: ^5.4.4
  integration_test:
    sdk: flutter
  network_image_mock: ^2.1.1
  fake_async: ^1.3.1
  mocktail: ^1.0.4
```

### Mock Generation
```bash
# Generate mocks
flutter packages pub run build_runner build
```

## 🚦 CI/CD Integration

### GitHub Actions
The test suite is integrated with GitHub Actions for:
- **Continuous Integration**: Run tests on every push/PR
- **Code Quality**: Format checking, linting, analysis
- **Security Scanning**: Vulnerability detection
- **Automated Releases**: Deploy on successful tests

### Workflow Files
- `.github/workflows/ci.yml`: Main CI pipeline
- `.github/workflows/code-quality.yml`: Code quality checks
- `.github/workflows/release.yml`: Automated releases

## 📝 Writing Tests

### Unit Test Example
```dart
group('CartBloc', () {
  test('emits [success] when AddToCart is successful', () {
    // Arrange
    when(mockRepository.addToCart(any, any))
        .thenAnswer((_) async => Right(cart));
    
    // Act
    bloc.add(CartEvent.addToCart(product, 1));
    
    // Assert
    expectLater(bloc.stream, emits(CartState.success(cart)));
  });
});
```

### Integration Test Example
```dart
testWidgets('Complete user journey: Browse products, add to cart, checkout',
    (WidgetTester tester) async {
  // Start the app
  app.main();
  await tester.pumpAndSettle();

  // Browse products
  expect(find.text('Featured Products'), findsOneWidget);
  
  // Add to cart
  await tester.tap(find.byType(InkWell).first);
  await tester.tap(find.text('Add to Cart'));
  
  // Verify success
  expect(find.text('Added to cart'), findsOneWidget);
});
```

## 🐛 Debugging Tests

### Common Issues
1. **Timeout Issues**: Increase timeout in test configuration
2. **Mock Issues**: Ensure mocks are properly generated
3. **Widget Issues**: Use `pumpAndSettle()` for async operations
4. **State Issues**: Wait for state changes with `expectLater()`

### Debug Commands
```bash
# Run specific test with verbose output
flutter test test/unit/bloc/cart_bloc_test.dart --verbose

# Run tests with debug info
flutter test --debug

# Run tests in debug mode
flutter test --debug --verbose
```

## 📈 Test Metrics

### Key Metrics
- **Test Coverage**: 90%+ for unit tests
- **Test Execution Time**: < 5 minutes for full suite
- **Test Reliability**: 99%+ pass rate
- **Code Quality**: A+ rating

### Monitoring
- Coverage reports generated on every run
- Test results uploaded to CI/CD
- Performance metrics tracked
- Quality gates enforced

## 🤝 Contributing

### Adding New Tests
1. Follow the existing test structure
2. Use descriptive test names
3. Include both positive and negative test cases
4. Add proper documentation
5. Ensure tests are maintainable

### Test Naming Convention
```dart
// Unit tests
test('should [expected behavior] when [condition]', () {});

// Widget tests
testWidgets('should [expected behavior] when [user action]', (tester) {});

// Integration tests
testWidgets('Complete user journey: [description]', (tester) {});
```

## 📚 Resources

- [Flutter Testing Guide](https://flutter.dev/docs/testing)
- [BLoC Testing](https://bloclibrary.dev/#/testing)
- [Integration Testing](https://flutter.dev/docs/testing/integration-tests)
- [Mockito Documentation](https://pub.dev/packages/mockito)
- [Test Coverage](https://flutter.dev/docs/testing/code-coverage)

---

**Happy Testing! 🎉**