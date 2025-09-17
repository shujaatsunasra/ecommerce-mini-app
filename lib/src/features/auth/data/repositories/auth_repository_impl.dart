import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/auth_request.dart';
import '../../domain/entities/auth_response.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../../../common/api/api_client.dart';
import '../../../../common/api/api_endpoints.dart';
import '../../../../common/storage/secure_storage_service.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final ApiClient _apiClient;
  final SecureStorageService _secureStorage;

  AuthRepositoryImpl(this._apiClient, this._secureStorage) {
    _setupAuthInterceptor();
  }

  void _setupAuthInterceptor() {
    _apiClient.dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _secureStorage.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            await logout();
          }
          handler.next(error);
        },
      ),
    );
  }

  @override
  Future<Either<Failure, AuthResponse>> login(LoginRequest request) async {
    try {
      final response = await _apiClient.dio.post(
        ApiEndpoints.login,
        data: request.toJson(),
      );

      final authResponse = AuthResponse.fromJson(response.data);
      
      // Store tokens securely
      await _secureStorage.saveToken(authResponse.token);
      await _secureStorage.saveUserId(authResponse.user.id.toString());

      return Right(authResponse);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.code));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message, e.code));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> register(RegisterRequest request) async {
    try {
      // DummyJSON register endpoint returns a user object directly, not an auth response
      final response = await _apiClient.dio.post(
        ApiEndpoints.register,
        data: request.toJson(),
      );

      // Create a mock token for the registered user (in real app, this would come from API)
      final user = User.fromJson(response.data);
      final mockToken = 'mock_token_${user.id}_${DateTime.now().millisecondsSinceEpoch}';
      
      final authResponse = AuthResponse(
        user: user,
        token: mockToken,
      );
      
      // Store tokens securely
      await _secureStorage.saveToken(authResponse.token);
      await _secureStorage.saveUserId(authResponse.user.id.toString());

      return Right(authResponse);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.code));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message, e.code));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<void> logout() async {
    await _secureStorage.clearAll();
  }

  @override
  Future<String?> getToken() async {
    return await _secureStorage.getToken();
  }
}
