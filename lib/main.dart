import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'src/common/theme/app_theme.dart';
import 'src/common/theme/theme_provider.dart';
import 'src/common/di/injection.dart';
import 'src/features/product/presentation/bloc/product_list_bloc.dart';
import 'src/features/product/presentation/bloc/product_detail_bloc.dart';
import 'src/features/cart/presentation/bloc/cart_bloc.dart';
import 'src/features/wishlist/presentation/bloc/wishlist_bloc.dart';
import 'src/features/auth/presentation/bloc/auth_bloc.dart';
import 'src/features/auth/presentation/bloc/auth_event.dart';
import 'src/features/auth/presentation/bloc/auth_state.dart';
import 'src/features/product/domain/repositories/product_repository.dart';
import 'src/features/cart/domain/repositories/cart_repository.dart';
import 'src/features/wishlist/domain/repositories/wishlist_repository.dart';
import 'src/features/auth/domain/repositories/auth_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'src/features/navigation/presentation/screens/main_navigation_screen.dart';
import 'src/features/auth/presentation/screens/login_screen.dart';
import 'src/features/product/presentation/screens/product_detail_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive
  await Hive.initFlutter();
  
  // Initialize HydratedBloc
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  
  // Configure dependencies
  await configureDependencies();
  
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeProviderBloc>(
          create: (context) => ThemeProviderBloc(),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(getIt<AuthRepository>()),
        ),
        BlocProvider<ProductListBloc>(
          create: (context) => ProductListBloc(
            getIt<ProductRepository>(),
            getIt<Connectivity>(),
          ),
        ),
        BlocProvider<ProductDetailBloc>(
          create: (context) => ProductDetailBloc(
            getIt<ProductRepository>(),
            getIt<Connectivity>(),
          ),
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(getIt<CartRepository>()),
        ),
        BlocProvider<WishlistBloc>(
          create: (context) => WishlistBloc(getIt<WishlistRepository>()),
        ),
      ],
      child: BlocBuilder<ThemeProviderBloc, ThemeProviderState>(
        builder: (context, themeState) {
          return MaterialApp(
            title: 'E-commerce Mini App',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeState.maybeWhen(
              light: () => ThemeMode.light,
              dark: () => ThemeMode.dark,
              orElse: () => ThemeMode.system,
            ),
            home: const AuthWrapper(),
            onGenerateRoute: (settings) {
              if (settings.name == '/product-detail') {
                final args = settings.arguments as Map<String, dynamic>?;
                return MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                    productId: args?['productId'] ?? '1',
                    title: args?['title'] ?? 'Product',
                    price: args?['price'] ?? '\$0.00',
                    imageUrl: args?['imageUrl'] ?? 'https://via.placeholder.com/300x300/FF6B35/FFFFFF?text=Product',
                    rating: args?['rating'] ?? 4.0,
                    reviewCount: args?['reviewCount'] ?? 0,
                    seller: args?['seller'] ?? 'Unknown',
                  ),
                );
              }
              return null;
            },
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  void initState() {
    super.initState();
    // Check authentication status when the app starts
    context.read<AuthBloc>().add(const AuthEvent.checkAuthStatus());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.when(
          initial: () => const LoginScreen(),
          loading: () => const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
          success: (user) => const MainNavigationScreen(),
          error: (message) => const LoginScreen(),
        );
      },
    );
  }
}
