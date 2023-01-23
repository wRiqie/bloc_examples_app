import 'package:bloc_app/login/data/models/api_response_model.dart';
import 'package:bloc_app/login/data/models/auth_model.dart';
import 'package:bloc_app/login/data/provider/fake_api.dart';

class AuthRepository {
  final FakeApi _api;

  AuthRepository(this._api);

  Future<ApiResponseModel<AuthModel>> signin({required AuthModel auth})
    => _api.signin(auth);
}