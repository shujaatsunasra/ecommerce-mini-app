import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../common/storage/secure_storage_service.dart';

@singleton
class ProductApiClient {
  late final Dio _dio;
  final SecureStorageService _secureStorage;

  ProductApiClient(this._secureStorage) {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://dummyjson.com',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _setupInterceptors();
  }

  void _setupInterceptors() {
    _dio.interceptors.addAll([
      _AuthInterceptor(_secureStorage),
      _ErrorInterceptor(),
      _RetryInterceptor(),
      if (kDebugMode) _LoggingInterceptor(),
    ]);
  }

  Dio get dio => _dio;
}

class _AuthInterceptor extends Interceptor {
  final SecureStorageService _secureStorage;

  _AuthInterceptor(this._secureStorage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final token = await _secureStorage.getToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    } catch (e) {
      // Continue without token if storage fails
      if (kDebugMode) {
        print('Failed to get auth token: $e');
      }
    }
    super.onRequest(options, handler);
  }
}

class _ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final error = _mapDioExceptionToDomainError(err);
    handler.reject(DioException(
      requestOptions: err.requestOptions,
      error: error,
      type: err.type,
      response: err.response,
    ));
  }

  Exception _mapDioExceptionToDomainError(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        return const NetworkException('Connection timeout - our servers are taking a coffee break ☕');
      case DioExceptionType.sendTimeout:
        return const NetworkException('Send timeout - your request got lost in the digital void');
      case DioExceptionType.receiveTimeout:
        return const NetworkException('Receive timeout - we\'re working on getting your data faster');
      case DioExceptionType.badResponse:
        return _handleBadResponse(err);
      case DioExceptionType.cancel:
        return const NetworkException('Request cancelled - no worries, you can try again');
      case DioExceptionType.connectionError:
        return const NetworkException('No internet connection - check your WiFi and try again');
      case DioExceptionType.unknown:
        return NetworkException('Something went wrong: ${err.message ?? 'Unknown error'}');
      default:
        return NetworkException('Network error: ${err.message ?? 'Unknown error'}');
    }
  }

  Exception _handleBadResponse(DioException err) {
    final statusCode = err.response?.statusCode;
    final message = err.response?.data?['message'] as String?;
    
    if (statusCode != null) {
      switch (statusCode) {
        case 400:
          return ServerException(message ?? 'Bad request - something\'s not quite right', '400');
        case 401:
          return const AuthException('Unauthorized - please log in again', '401');
        case 403:
          return const AuthException('Forbidden - you don\'t have permission for this', '403');
        case 404:
          return ServerException(message ?? 'Not found - this product seems to have vanished', '404');
        case 429:
          return const ServerException('Too many requests - slow down there, speed demon!', '429');
        case 500:
          return const ServerException('Server error - our team is fixing this right now', '500');
        case 502:
          return const ServerException('Bad gateway - our servers are having a moment', '502');
        case 503:
          return const ServerException('Service unavailable - we\'re temporarily down for maintenance', '503');
        default:
          return ServerException(
            message ?? 'Server error: $statusCode - something unexpected happened', 
            statusCode.toString()
          );
      }
    }
    return const ServerException('Unknown server error');
  }
}

class _RetryInterceptor extends Interceptor {
  static const int maxRetries = 3;
  static const Duration retryDelay = Duration(seconds: 2);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err) && _getRetryCount(err) < maxRetries) {
      await Future.delayed(retryDelay);
      
      try {
        final response = await _retry(err.requestOptions);
        handler.resolve(response);
        return;
      } catch (e) {
        // Continue to next retry or fail
      }
    }
    handler.next(err);
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
           err.type == DioExceptionType.sendTimeout ||
           err.type == DioExceptionType.receiveTimeout ||
           err.type == DioExceptionType.connectionError ||
           (err.response?.statusCode != null && 
            err.response!.statusCode! >= 500);
  }

  int _getRetryCount(DioException err) {
    return err.requestOptions.extra['retryCount'] as int? ?? 0;
  }

  Future<Response> _retry(RequestOptions requestOptions) async {
    final retryCount = _getRetryCount(DioException(requestOptions: requestOptions));
    requestOptions.extra['retryCount'] = retryCount + 1;
    
    return Dio().fetch(requestOptions);
  }
}

class _LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print('🚀 REQUEST[${options.method}] => PATH: ${options.path}');
      print('Headers: ${options.headers}');
      if (options.data != null) {
        print('Data: ${options.data}');
      }
      if (options.queryParameters.isNotEmpty) {
        print('Query Parameters: ${options.queryParameters}');
      }
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print('✅ RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
      print('Data: ${response.data}');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print('❌ ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
      print('Message: ${err.message}');
      if (err.response?.data != null) {
        print('Error Data: ${err.response?.data}');
      }
    }
    super.onError(err, handler);
  }
}
