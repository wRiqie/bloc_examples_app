import 'package:bloc_app/login/business_logic/services/hive_service.dart';
import 'package:bloc_app/login/data/provider/fake_api.dart';
import 'package:bloc_app/login/data/provider/firebase_api.dart';
import 'package:bloc_app/login/data/repositories/auth_repository.dart';
import 'package:bloc_app/todo_list/domain/repositories/get_all_todos_repository.dart';
import 'package:bloc_app/todo_list/domain/useCases/get_all_todos/get_all_todos_usecase.dart';
import 'package:mocktail/mocktail.dart';

class FakeApiMock extends Mock implements FakeApi {}

class FirebaseApiMock extends Mock implements FirebaseApi {}

class AuthRepositoryMock extends Mock implements AuthRepository {}

class HiveServiceMock<T> extends Mock implements HiveService<T> {}

class GetAllTodosRepositoryImpMock extends Mock
    implements GetAllTodosRepository {}

class GetAllTodosUsecaseImpMock extends Mock implements GetAllTodosUsecase {}