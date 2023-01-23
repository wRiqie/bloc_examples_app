import 'package:bloc_app/login/data/models/auth_model.dart';
import 'package:bloc_app/login/data/provider/fake_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final api = FakeApi();

  group('[ApiTest]', () {
    test('expect return success without message and with object', () async {
      final auth = AuthModel(email: 'test123@outlook.com', password: '123456');
      final response = await api.signin(auth);
      expect(response.isSuccess, true);
      expect(response.message, null);
      expect(response.object != null, true);
      expect(response.object?.accessToken != null, true);
    });

    test('expect returns error with message and without object', () async {
      final auth = AuthModel(email: 'test.com', password: '123456');
      final response = await api.signin(auth);
      expect(response.isSuccess, false);
      expect(response.message?.isEmpty, false);
      expect(response.object, null);
    });
  });
}
