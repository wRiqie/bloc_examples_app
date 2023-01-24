import 'package:bloc_app/login/data/models/api_response_model.dart';
import 'package:bloc_app/login/data/models/auth_model.dart';
import 'package:bloc_app/login/data/provider/fake_api.dart';
import 'package:bloc_app/login/data/provider/firebase_api.dart';

class AuthRepository {
  final FakeApi _api;
  final FirebaseApi _firebaseApi;

  AuthRepository(this._api, this._firebaseApi);

  Future<ApiResponseModel<AuthModel>> signin({required AuthModel auth})
    => _api.signin(auth);

  Future<ApiResponseModel<AuthModel>> signInWithGoogle() 
    => _firebaseApi.signInWithGoogle();
}