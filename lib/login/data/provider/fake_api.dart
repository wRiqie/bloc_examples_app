import 'package:bloc_app/login/data/models/api_response_model.dart';
import 'package:bloc_app/login/data/models/auth_model.dart';
import 'package:bloc_app/login/data/provider/base_api.dart';
import 'package:uuid/uuid.dart';

class FakeApi extends BaseApi {
  Future<ApiResponseModel<AuthModel>> signin(AuthModel auth) async {
    if (!auth.email.contains('@')) {
      return ApiResponseModel(
        isSuccess: false,
        message: 'Invalid e-mail!',
      );
    }
    return await Future.delayed(const Duration(seconds: 5), () {
      auth.accessToken = const Uuid().v4();
      return ApiResponseModel(
        isSuccess: true,
        object: auth,
      );
    });
  }
}
