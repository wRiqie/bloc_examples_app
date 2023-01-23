import 'package:bloc_app/login/data/models/api_response_model.dart';
import 'package:bloc_app/login/data/models/auth_model.dart';

abstract class AuthState {}

class AuthIdle extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final ApiResponseModel<AuthModel> response;

  AuthSuccess(this.response);
}

class AuthError extends AuthState {
  final String? message;

  AuthError(this.message);
}