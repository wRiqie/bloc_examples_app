import 'package:bloc_app/login/data/models/api_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('[ApiResponseModel]', () {
    test('toString', () {
      final response = ApiResponseModel(isSuccess: true);
      expect(
        response.toString(),
        'ApiResponseModel(isSuccess: ${response.isSuccess}, object: ${response.object}, message: ${response.message})',
      );
    });
  });
}
