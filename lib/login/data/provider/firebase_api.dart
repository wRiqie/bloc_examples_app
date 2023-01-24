import 'package:bloc_app/login/data/models/auth_model.dart';
import 'package:bloc_app/login/data/provider/base_api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/api_response_model.dart';

class FirebaseApi extends BaseApi {
  final FirebaseAuth fireAuth;

  FirebaseApi(this.fireAuth);

  Future<ApiResponseModel<AuthModel>> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final authCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (authCredential.user != null && authCredential.credential != null) {
        return ApiResponseModel(
          isSuccess: true,
          object: AuthModel(
            email: authCredential.user?.email ?? '',
            accessToken: authCredential.credential?.accessToken,
          ),
        );
      } else {
        return ApiResponseModel(
          isSuccess: false,
          message: 'Não foi possível realizar login com google',
        );
      }
    } on FirebaseAuthException catch (e) {
      return ApiResponseModel(
        isSuccess: false,
        message: e.message,
      );
    } catch(e) {
      return ApiResponseModel(
        isSuccess: false,
        message: e.toString(),
      );
    }
  }
}
