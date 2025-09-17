# 🛍️ E-commerce Mini App

A production-ready Flutter e-commerce mini-app built with clean architecture, featuring authentication, product browsing, shopping cart, wishlist, and user profile management.

## 📱 App Demo

### Video Demonstration
[mini-ecom.webm](https://github.com/user-attachments/assets/92fc6b10-4b5e-4a88-aaf4-17508884cf1a)


*Watch the app in action - showcasing product browsing, cart management, wishlist functionality, and user authentication*

### Key Features Demonstrated
- **Product Catalog**: Browse products with infinite scroll and advanced filtering
- **Shopping Cart**: Add/remove items with smooth animations
- **Wishlist**: Save favorite products for later
- **User Authentication**: Secure login/register system
- **Profile Management**: User settings and preferences

### Download APK
[![Download APK](https://img.shields.io/badge/Download-APK-green?style=for-the-badge&logo=android)](https://github.com/shujaatsunasra/ecommerce-mini-app/releases/latest/download/app-release.apk)

**Latest Release**: [v1.0.0](https://github.com/shujaatsunasra/ecommerce-mini-app/releases/latest) | **APK Size**: 49.2MB

## 🚀 Quick Setup

### Prerequisites
- Flutter SDK (3.8.1 or higher)
- Dart SDK (3.8.1 or higher)
- Android Studio / VS Code
- Chrome browser (for web development)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/shujaatsunasra/ecommerce-mini-app.git
   cd ecommerce-mini-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   ```bash
   dart run build_runner build
   ```

4. **Run the app**
   ```bash
   flutter run --debug
   ```

### Quick Start Script
Run the PowerShell script to set the default directory:
```powershell
.\set_default_directory.ps1
```

## 🏗️ Architecture Overview

### Solution Approach
This e-commerce app follows **Clean Architecture** principles with a **feature-based modular structure**. The solution emphasizes:

- **Separation of Concerns**: Clear boundaries between presentation, business logic, and data layers
- **Testability**: Each layer can be tested independently
- **Maintainability**: Modular structure makes it easy to add new features
- **Scalability**: Architecture supports growth and feature additions
- **Reusability**: Common components and utilities are shared across features

### Architecture Decisions

#### 1. **Clean Architecture Implementation**
```
┌─────────────────────────────────────────────────────────────┐
│                    Presentation Layer                       │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐          │
│  │   Screens   │ │   Widgets   │ │    BLoCs    │          │
│  └─────────────┘ └─────────────┘ └─────────────┘          │
└─────────────────────────────────────────────────────────────┘
┌─────────────────────────────────────────────────────────────┐
│                    Business Logic Layer                     │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐          │
│  │  Use Cases  │ │  Entities   │ │  Repositories│          │
│  └─────────────┘ └─────────────┘ └─────────────┘          │
└─────────────────────────────────────────────────────────────┘
┌─────────────────────────────────────────────────────────────┐
│                      Data Layer                            │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐          │
│  │  API Client │ │ Local Storage│ │  Data Sources│         │
│  └─────────────┘ └─────────────┘ └─────────────┘          │
└─────────────────────────────────────────────────────────────┘
```

**Why Clean Architecture?**
- **Independence**: UI, business logic, and data are independent
- **Testability**: Each layer can be unit tested in isolation
- **Flexibility**: Easy to change frameworks or data sources
- **Maintainability**: Clear structure makes code easier to understand

#### 2. **State Management: Flutter BLoC**
```dart
// Example: Cart BLoC
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required this.cartRepository}) : super(CartInitial()) {
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
  }
}
```

**Why BLoC?**
- **Reactive Programming**: Stream-based state management
- **Testability**: Easy to test business logic
- **Predictability**: Unidirectional data flow
- **Separation**: Clear separation between UI and business logic
- **Persistence**: Built-in state persistence with HydratedBloc

#### 3. **Feature-Based Module Structure**
```
lib/src/features/
├── auth/                 # Authentication feature
│   ├── data/            # Data layer
│   ├── domain/          # Business logic
│   └── presentation/    # UI layer
├── product/             # Product management
├── cart/                # Shopping cart
├── wishlist/            # Wishlist management
└── profile/             # User profile
```

**Why Feature-Based?**
- **Modularity**: Each feature is self-contained
- **Team Collaboration**: Different teams can work on different features
- **Code Organization**: Related code is grouped together
- **Scalability**: Easy to add new features without affecting existing ones

#### 4. **Data Layer Architecture**
```dart
// Repository Pattern
abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts();
  Future<Either<Failure, Product>> getProductById(String id);
}

// Implementation
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  
  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final products = await remoteDataSource.getProducts();
      await localDataSource.cacheProducts(products);
      return Right(products);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
```

**Why Repository Pattern?**
- **Abstraction**: Hides data source implementation details
- **Flexibility**: Easy to switch between data sources
- **Caching**: Centralized caching logic
- **Error Handling**: Consistent error handling across features

#### 5. **Dependency Injection with GetIt**
```dart
// Service Locator
final sl = GetIt.instance;

void setupDependencies() {
  // External
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => Hive.box('app_data'));
  
  // Data sources
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(sl()),
  );
  
  // Repositories
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(sl(), sl()),
  );
}
```

**Why GetIt?**
- **Simplicity**: Easy to set up and use
- **Performance**: Lazy loading and singleton management
- **Testability**: Easy to mock dependencies for testing
- **Type Safety**: Compile-time dependency resolution

#### 6. **Local Storage with Hive**
```dart
// Hive Adapters
@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final String title;
  
  // ... other fields
}
```

**Why Hive?**
- **Performance**: Fast key-value storage
- **Type Safety**: Strongly typed data models
- **Cross-Platform**: Works on all Flutter platforms
- **No Native Dependencies**: Pure Dart implementation

#### 7. **API Integration with Dio**
```dart
// API Client
class ApiClient {
  final Dio _dio;
  
  ApiClient(this._dio) {
    _dio.options.baseUrl = ApiEndpoints.baseUrl;
    _dio.interceptors.addAll([
      LogInterceptor(),
      AuthInterceptor(),
      ErrorInterceptor(),
    ]);
  }
}
```

**Why Dio?**
- **Interceptors**: Request/response transformation
- **Error Handling**: Comprehensive error handling
- **Request Cancellation**: Built-in request cancellation
- **File Upload**: Easy file upload support

## 🎯 Key Features

### 🔐 Authentication System
- **Secure Login/Register** with form validation
- **Token-based Authentication** using JWT
- **Auto-logout** on token expiration
- **Secure Storage** using flutter_secure_storage

### 🛒 Product Management
- **Infinite Scroll** with pagination
- **Real-time Search** with debouncing
- **Advanced Filtering** by category, brand, price, rating
- **Product Details** with image gallery
- **Offline Support** with cached data

### 🛍️ Shopping Cart
- **Add/Remove Items** with smooth animations
- **Quantity Management** with validation
- **Cart Persistence** using Hive
- **Total Calculation** with tax handling
- **Empty State** with call-to-action

### ❤️ Wishlist System
- **Add/Remove Products** to/from wishlist
- **Wishlist Persistence** using Hive
- **Grid Layout** with product cards
- **Empty State** with navigation to products

### 👤 User Profile
- **User Information** display and editing
- **Settings Management** with persistence
- **Order History** (placeholder for future implementation)
- **Help & Support** sections
- **Logout Functionality** with confirmation

### 🎨 UI/UX Design
- **Material 3 Design** with modern theming
- **Dark/Light Theme** support with system preference
- **Responsive Design** for different screen sizes
- **Smooth Animations** and micro-interactions
- **Loading States** with shimmer effects
- **Error Handling** with user-friendly messages

## 📱 Supported Platforms

- ✅ **Web** (Chrome, Edge, Firefox, Safari)
- ✅ **Android** (API 21+)
- ✅ **iOS** (iOS 11+)
- ✅ **Windows** (Windows 10+)
- ✅ **macOS** (macOS 10.14+)
- ✅ **Linux** (Ubuntu 18.04+)

## 🛠️ Development

### Code Generation
```bash
# Generate all code
dart run build_runner build

# Watch for changes
dart run build_runner watch

# Clean and rebuild
dart run build_runner build --delete-conflicting-outputs
```

### Testing
```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test
flutter test test/features/cart/presentation/bloc/cart_bloc_test.dart
```

### Code Quality
```bash
# Run static analysis
flutter analyze

# Fix auto-fixable issues
dart fix --apply

# Format code
dart format .
```

## 📦 Key Dependencies

### Core Dependencies
- `flutter_bloc: ^8.1.6` - State management
- `hydrated_bloc: ^9.1.5` - State persistence
- `dio: ^5.7.0` - HTTP client
- `hive: ^2.2.3` - Local storage
- `get_it: ^8.0.0` - Dependency injection
- `freezed: ^2.5.7` - Code generation

### UI Dependencies
- `cached_network_image: ^3.4.1` - Image caching
- `shimmer: ^3.0.0` - Loading animations
- `infinite_scroll_pagination: ^4.0.0` - Pagination
- `flutter_secure_storage: ^9.2.2` - Secure storage

## 🔧 Configuration

### API Configuration
The app uses DummyJSON API for product data. To change the API endpoint:
```dart
// lib/src/common/api/api_endpoints.dart
class ApiEndpoints {
  static const String baseUrl = 'https://dummyjson.com';
  static const String products = '/products';
  static const String categories = '/products/categories';
}
```

### Theme Configuration
Customize the app theme:
```dart
// lib/src/common/theme/app_theme.dart
class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  );
  
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.dark,
    ),
  );
}
```

## 🚀 CI/CD Pipeline

The project includes a complete CI/CD pipeline with:

### GitHub Actions Workflows
- **CI Pipeline** (`.github/workflows/ci.yml`): Automated testing and building
- **Code Quality** (`.github/workflows/code-quality.yml`): Linting and analysis
- **Release Pipeline** (`.github/workflows/release.yml`): Automated releases

### Features
- **Multi-Platform Builds**: Android APK, AAB, iOS, and Web
- **Automated Testing**: Unit, integration, and widget tests
- **Security Scanning**: Trivy vulnerability detection
- **Code Coverage**: Automated coverage reporting
- **Quality Gates**: Code formatting, linting, and security checks

## 🐛 Troubleshooting

### Common Issues

1. **Build errors after dependency changes**
   ```bash
   flutter clean
   flutter pub get
   dart run build_runner build
   ```

2. **Code generation issues**
   ```bash
   dart run build_runner clean
   dart run build_runner build --delete-conflicting-outputs
   ```

3. **Analysis issues**
   ```bash
   flutter analyze
   dart fix --apply
   ```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request


**Built with ❤️ using Flutter**
