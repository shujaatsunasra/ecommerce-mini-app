// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:ecommerce_mini_app/src/common/api/api_client.dart' as _i566;
import 'package:ecommerce_mini_app/src/common/storage/hive_storage_service.dart'
    as _i279;
import 'package:ecommerce_mini_app/src/common/storage/secure_storage_service.dart'
    as _i1006;
import 'package:ecommerce_mini_app/src/features/auth/data/repositories/auth_repository_impl.dart'
    as _i833;
import 'package:ecommerce_mini_app/src/features/auth/domain/repositories/auth_repository.dart'
    as _i185;
import 'package:ecommerce_mini_app/src/features/cart/data/repositories/cart_repository_impl.dart'
    as _i700;
import 'package:ecommerce_mini_app/src/features/cart/domain/repositories/cart_repository.dart'
    as _i596;
import 'package:ecommerce_mini_app/src/features/product/data/datasources/product_api_client.dart'
    as _i225;
import 'package:ecommerce_mini_app/src/features/product/data/repositories/product_repository_impl.dart'
    as _i449;
import 'package:ecommerce_mini_app/src/features/product/domain/repositories/product_repository.dart'
    as _i936;
import 'package:ecommerce_mini_app/src/features/wishlist/data/repositories/wishlist_repository_impl.dart'
    as _i398;
import 'package:ecommerce_mini_app/src/features/wishlist/domain/repositories/wishlist_repository.dart'
    as _i1071;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i566.ApiClient>(() => _i566.ApiClient());
    gh.singleton<_i279.HiveStorageService>(() => _i279.HiveStorageService());
    gh.singleton<_i1006.SecureStorageService>(
        () => _i1006.SecureStorageService());
    gh.factory<_i1071.WishlistRepository>(
        () => _i398.WishlistRepositoryImpl(gh<_i279.HiveStorageService>()));
    gh.factory<_i596.CartRepository>(
        () => _i700.CartRepositoryImpl(gh<_i279.HiveStorageService>()));
    gh.singleton<_i225.ProductApiClient>(
        () => _i225.ProductApiClient(gh<_i1006.SecureStorageService>()));
    gh.factory<_i185.AuthRepository>(() => _i833.AuthRepositoryImpl(
          gh<_i566.ApiClient>(),
          gh<_i1006.SecureStorageService>(),
        ));
    gh.factory<_i936.ProductRepository>(() => _i449.ProductRepositoryImpl(
          gh<_i225.ProductApiClient>(),
          gh<_i279.HiveStorageService>(),
          gh<_i895.Connectivity>(),
        ));
    return this;
  }
}
