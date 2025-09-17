import 'package:get_it/get_it.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../features/product/domain/repositories/product_repository.dart';
import '../../features/product/presentation/bloc/product_list_bloc.dart';
import '../../features/product/presentation/bloc/product_detail_bloc.dart';
import '../../features/cart/domain/repositories/cart_repository.dart';
import '../../features/cart/presentation/bloc/cart_bloc.dart';
import '../../features/wishlist/domain/repositories/wishlist_repository.dart';
import '../../features/wishlist/presentation/bloc/wishlist_bloc.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';

void registerExternalDependencies(GetIt getIt) {
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());

  // Register BLoCs manually
  getIt.registerFactory<ProductListBloc>(
    () => ProductListBloc(
      getIt<ProductRepository>(),
      getIt<Connectivity>(),
    ),
  );

  getIt.registerFactory<ProductDetailBloc>(
    () => ProductDetailBloc(
      getIt<ProductRepository>(),
      getIt<Connectivity>(),
    ),
  );

  getIt.registerFactory<CartBloc>(
    () => CartBloc(getIt<CartRepository>()),
  );

  getIt.registerFactory<WishlistBloc>(
    () => WishlistBloc(getIt<WishlistRepository>()),
  );

  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(getIt<AuthRepository>()),
  );
}
