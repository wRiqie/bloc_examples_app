import 'package:bloc_app/todo_list/data/datasources/get_all_todos_datasource.dart';
import 'package:bloc_app/todo_list/data/repositories/get_all_todos_repository_imp.dart';
import 'package:bloc_app/todo_list/domain/repositories/get_all_todos_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetAllTodosDataSourceMock extends Mock implements GetAllTodosDataSource {}

void main() {
  late GetAllTodosDataSourceMock dataSource;
  late GetAllTodosRepository repository;

  setUp(() {
    dataSource = GetAllTodosDataSourceMock();
    repository = GetAllTodosRepositoryImp(dataSource);
  });

  test('should return a list of todos', () async {
    when(
      () => dataSource(),
    ).thenAnswer(
      (_) => Future.value(
        [
          {
            'id': 1,
            'title': 'Teste',
            'body': 'Teste 123',
          },
          {
            'id': 2,
            'title': 'Teste',
            'body': 'Teste 123',
          }
        ],
      ),
    );
    final res = await repository();

    expect(res.isSuccess, true);
    expect(res.data?.isEmpty, false);
  });
}
