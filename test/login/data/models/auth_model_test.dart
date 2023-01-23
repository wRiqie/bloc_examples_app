import 'package:bloc_app/login/data/models/auth_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('[AuthModel]', () {
    test('CopyWith', () {
      final auth = AuthModel(
        email: 'test',
        password: 'test',
        accessToken: 'test',
      );
      expect(auth.copyWith(email: 't').email, 't');
      expect(auth.copyWith(password: 't').password, 't');
      expect(auth.copyWith(accessToken: 't').accessToken, 't');
    });

    test('toString', () {
      final auth = AuthModel(
        email: 'test',
        password: 'test',
        accessToken: 'test',
      );
      expect(auth.toString(),
          'AuthModel(email: ${auth.email}, password: ${auth.password}, accessToken: ${auth.accessToken})');
    });
  });
}
