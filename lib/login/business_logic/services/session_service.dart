// coverage:ignore-file
import 'package:bloc_app/login/business_logic/services/hive_service.dart';
import 'package:bloc_app/login/core/constants.dart';
import 'package:bloc_app/login/data/models/auth_model.dart';

class SessionService {
  final HiveService<AuthModel> _service;

  SessionService(this._service);

  Future<void> saveSession(AuthModel session) async {
    if (await _service.findByKey(Constants.sessionActive) != null) {
      await clearSession();
    }
    await _service.put(Constants.sessionActive, session);
  }

  Future<AuthModel?> getActualSession() {
    return _service.findByKey(Constants.sessionActive);
  }

  Future<void> clearSession() {
    return _service.deleteByKey(Constants.sessionActive);
  }

  Future<void> close() {
    return _service.close();
  }
}
