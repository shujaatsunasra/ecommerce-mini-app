# 🛍️ E-commerce Mini App

A production-ready Flutter e-commerce mini-app built with clean architecture, featuring authentication, product browsing, shopping cart, wishlist, and user profile management.

## ✨ Features

### 🔐 Authentication
- **Login/Register** screens with beautiful UI
- **Secure token storage** using `flutter_secure_storage`
- **Form validation** with user-friendly error messages
- **Auto-logout** on token expiration

### 🛒 Product Management
- **Product listing** with grid layout and infinite scroll
- **Search functionality** with real-time filtering
- **Advanced filtering** by category, brand, price range, and rating
- **Product cards** with images, ratings, and pricing
- **Offline support** with cached data display

### 🛍️ Shopping Cart
- **Add/Remove/Update** quantities with smooth animations
- **Cart persistence** using Hive local storage
- **Total calculation** and checkout preparation
- **Empty cart state** with call-to-action

### ❤️ Wishlist System
- **Add/Remove** products to/from wishlist
- **Wishlist persistence** using Hive
- **Grid layout** with product details
- **Empty wishlist state** with navigation

### 👤 User Profile
- **User information** display
- **Settings and preferences** sections
- **Order history** placeholder
- **Help and support** sections
- **Logout functionality** with confirmation

### 🎨 UI/UX
- **Material 3 Design** with modern theming
- **Dark/Light theme** support with persistence
- **Bottom Navigation Bar** with 4 main sections
- **Responsive design** for different screen sizes
- **Smooth animations** and transitions

## 🏗️ Architecture

### Clean Architecture
```
lib/
├── src/
│   ├── common/           # Shared utilities and services
│   │   ├── api/         # API client and endpoints
│   │   ├── di/          # Dependency injection
│   │   ├── storage/     # Local storage services
│   │   └── theme/       # App theming
│   └── features/        # Feature-based modules
│       ├── auth/        # Authentication feature
│       ├── product/     # Product management
│       ├── cart/        # Shopping cart
│       ├── wishlist/    # Wishlist management
│       ├── profile/     # User profile
│       └── home/        # Home screen
```

### State Management
- **Flutter BLoC** for reactive state management
- **Hydrated BLoC** for state persistence
- **Freezed** for immutable data classes
- **Equatable** for value equality

### Data Layer
- **Dio** HTTP client with interceptors
- **Hive** for local data storage
- **Repository pattern** for data abstraction
- **Use cases** for business logic

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.8.1 or higher)
- Dart SDK (3.8.1 or higher)
- Android Studio / VS Code
- Chrome browser (for web development)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd ecommerce_mini_app
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

# Run specific test
flutter test test/features/product/presentation/bloc/product_list_bloc_test.dart
```

### Analysis
```bash
# Run static analysis
flutter analyze

# Fix auto-fixable issues
dart fix --apply
```

## 📦 Dependencies

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
The app uses DummyJSON API for product data. To change the API endpoint, update:
```dart
// lib/src/common/api/api_endpoints.dart
class ApiEndpoints {
  static const String baseUrl = 'https://dummyjson.com';
  // ... other endpoints
}
```

### Theme Configuration
Customize the app theme in:
```dart
// lib/src/common/theme/app_theme.dart
class AppTheme {
  static final ThemeData lightTheme = // Light theme
  static final ThemeData darkTheme = // Dark theme
}
```

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

## 📞 Support

For support, email support@example.com or create an issue in the repository.

---

**Built with ❤️ using Flutter**