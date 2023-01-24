import 'package:bloc_app/login/data/models/auth_model.dart';

abstract class AuthEvent {}

class AuthSignin extends AuthEvent {
  final AuthModel auth;

  AuthSignin(this.auth);
}

class AuthSigninWithGoogle extends AuthEvent {}
