import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([this.message, this.code]);
  
  final String? message;
  final String? code;

  @override
  List<Object?> get props => [message, code];
}

class ServerFailure extends Failure {
  const ServerFailure([super.message, super.code]);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message, super.code]);
}

class CacheFailure extends Failure {
  const CacheFailure([super.message, super.code]);
}

class AuthFailure extends Failure {
  const AuthFailure([super.message, super.code]);
}

class ValidationFailure extends Failure {
  const ValidationFailure([super.message, super.code]);
}
