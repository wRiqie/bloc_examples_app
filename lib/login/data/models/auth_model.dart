import 'package:hive_flutter/hive_flutter.dart';

part 'auth_model.g.dart';

@HiveType(typeId: 0)
class AuthModel {
  @HiveField(0)
  final String email;

  final String? password;
  
  @HiveField(1)
  String? accessToken;

  AuthModel({
    required this.email,
    this.password,
    this.accessToken,
  });

  AuthModel copyWith({
    String? email,
    String? password,
    String? accessToken,
  }) {
    return AuthModel(
      email: email ?? this.email,
      password: password ?? this.password,
      accessToken: accessToken ?? this.accessToken,
    );
  }

  @override
  String toString() =>
      'AuthModel(email: $email, password: $password, accessToken: $accessToken)';
}
