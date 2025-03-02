import '../../../data/models/user_model.dart';

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}

class AuthState {
  final bool isLoading;
  final bool isPasswordVisible;
  final String? errorMessage;

  AuthState({
    this.isLoading = false,
    this.isPasswordVisible = false,
    this.errorMessage,
  });

  AuthState copyWith({
    bool? isLoading,
    bool? isPasswordVisible,
    String? errorMessage,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      errorMessage: errorMessage,
    );
  }
}

class UserLoggedIn extends AuthState {
  final String message;
  final String token;
  final User user;
  UserLoggedIn( {required this.message, required this.token, required this.user});
}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
