abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  String errorMessage;
  AuthError({required this.errorMessage});
}

class AuthSuccess extends AuthState {}

// class AuthInitial extends AuthState {}
