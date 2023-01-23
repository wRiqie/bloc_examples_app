import 'package:bloc_app/login/business_logic/services/hive_service.dart';
import 'package:bloc_app/login/business_logic/services/session_service.dart';
import 'package:bloc_app/login/core/constants.dart';
import 'package:bloc_app/login/data/models/auth_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  late HiveServiceMock<AuthModel> serviceMock;
  late SessionService sessionService;
  setUp(() async {
    serviceMock = HiveServiceMock<AuthModel>();
    sessionService = SessionService(serviceMock);
  });

  tearDown(() async {
    sessionService.close();
  });

  group('[SessionService]', () {
    
  });
}
