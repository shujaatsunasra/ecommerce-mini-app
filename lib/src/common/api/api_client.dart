import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../core/errors/exceptions.dart';

@singleton
class ApiClient {
  late final Dio _dio;

  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://dummyjson.com',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    _setupInterceptors();
  }

  void _setupInterceptors() {
    _dio.interceptors.addAll([
      _AuthInterceptor(),
      _ErrorInterceptor(),
      _RetryInterceptor(),
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    ]);
  }

  Dio get dio => _dio;
}

class _AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Token will be added by the auth service
    super.onRequest(options, handler);
  }
}

class _ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const NetworkException('Connection timeout');
      case DioExceptionType.badResponse:
        final statusCode = err.response?.statusCode;
        if (statusCode != null) {
          switch (statusCode) {
            case 400:
              throw ServerException('Bad request', '400');
            case 401:
              throw const AuthException('Unauthorized', '401');
            case 403:
              throw const AuthException('Forbidden', '403');
            case 404:
              throw ServerException('Not found', '404');
            case 500:
              throw ServerException('Internal server error', '500');
            default:
              throw ServerException('Server error: $statusCode', statusCode.toString());
          }
        }
        break;
      case DioExceptionType.cancel:
        throw const NetworkException('Request cancelled');
      case DioExceptionType.connectionError:
        throw const NetworkException('No internet connection');
      case DioExceptionType.unknown:
        throw NetworkException('Unknown network error: ${err.message ?? 'No message'}');
      default:
        throw NetworkException('Network error: ${err.message ?? 'Unknown error'}');
    }
  }
}

class _RetryInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err)) {
      try {
        final response = await _retry(err.requestOptions);
        handler.resolve(response);
        return;
      } catch (e) {
        handler.next(err);
        return;
      }
    }
    handler.next(err);
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
           err.type == DioExceptionType.sendTimeout ||
           err.type == DioExceptionType.receiveTimeout ||
           (err.response?.statusCode != null && err.response!.statusCode! >= 500);
  }

  Future<Response> _retry(RequestOptions requestOptions) async {
    await Future.delayed(const Duration(seconds: 1));
    return ApiClient().dio.fetch(requestOptions);
  }
}
