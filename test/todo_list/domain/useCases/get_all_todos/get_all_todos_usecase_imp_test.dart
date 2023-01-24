import 'package:bloc_app/todo_list/domain/entities/todo_entity.dart';
import 'package:bloc_app/todo_list/domain/repositories/get_all_todos_repository.dart';
import 'package:bloc_app/todo_list/domain/useCases/get_all_todos/get_all_todos_usecase_imp.dart';
import 'package:bloc_app/todo_list/shared/models/default_response_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetAllTodosRepositoryImpMock extends Mock
    implements GetAllTodosRepository {}

void main() {
  test('Expect get list of todos', () async {
    final repository = GetAllTodosRepositoryImpMock();
    when(() => repository()).thenAnswer(
        (_) => Future.value(DefaultResponseModel(isSuccess: true, data: [
              TodoEntity(
                id: 1,
                title: 'title',
                body: 'body',
                createdAt: DateTime.now(),
              ),
            ])));

    final useCase = GetAllTodosUsecaseImp(repository);
    final todos = await useCase();
    expect(todos.data?.isNotEmpty, true);
    expect(todos.data?.first.id, 1);
  });

  test('Expect get empty list of todos', () async {
    final repository = GetAllTodosRepositoryImpMock();
    when(() => repository()).thenAnswer(
      (_) => Future.value(
        DefaultResponseModel(
          isSuccess: true,
          data: [],
        ),
      ),
    );
    final useCase = GetAllTodosUsecaseImp(repository);
    final todos = await useCase();

    expect(todos.data?.isNotEmpty, false);
  });
}
