import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/entities/auth_request.dart';
import '../../domain/entities/user.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(const AuthState.initial()) {
    on<Login>(_onLogin);
    on<Register>(_onRegister);
    on<Logout>(_onLogout);
    on<CheckAuthStatus>(_onCheckAuthStatus);
  }

  Future<void> _onLogin(Login event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    
    final result = await _authRepository.login(
      LoginRequest(
        username: event.username,
        password: event.password,
      ),
    );

    result.fold(
      (failure) => emit(AuthState.error(failure.message ?? 'Authentication failed')),
      (authResponse) => emit(AuthState.success(authResponse.user)),
    );
  }

  Future<void> _onRegister(Register event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    
    final result = await _authRepository.register(
      RegisterRequest(
        firstName: event.username, // Using username as firstName for simplicity
        lastName: '',
        email: event.email,
        username: event.username,
        password: event.password,
      ),
    );

    result.fold(
      (failure) => emit(AuthState.error(failure.message ?? 'Authentication failed')),
      (authResponse) => emit(AuthState.success(authResponse.user)),
    );
  }

  Future<void> _onLogout(Logout event, Emitter<AuthState> emit) async {
    await _authRepository.logout();
    emit(const AuthState.initial());
  }

  Future<void> _onCheckAuthStatus(CheckAuthStatus event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    
    try {
      final token = await _authRepository.getToken();
      if (token != null && token.isNotEmpty) {
        // In a real app, you would validate the token with the server
        // For now, we'll create a mock user based on stored data
        // This ensures the user stays logged in across app restarts
        emit(const AuthState.success(
          User(
            id: 1,
            firstName: 'User',
            lastName: 'Name',
            email: 'user@example.com',
            username: 'user',
          ),
        ));
      } else {
        emit(const AuthState.initial());
      }
    } catch (e) {
      // If there's any error checking auth status, clear everything and go to login
      await _authRepository.logout();
      emit(const AuthState.initial());
    }
  }
}
