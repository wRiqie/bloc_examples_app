import 'package:bloc_app/todo_list/domain/entities/todo_entity.dart';
import 'package:bloc_app/todo_list/domain/repositories/add_todo_repository.dart';
import 'package:bloc_app/todo_list/domain/useCases/add_todo/add_todo_usecase_imp.dart';
import 'package:bloc_app/todo_list/core/models/default_response_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class AddTodoRepositoryImpMock extends Mock implements AddTodoRepository {}

void main() {
  test('should add todo with success', () async {
    final todo = TodoEntity(
      id: 1,
      title: 'title',
      body: 'body',
    );
    final repository = AddTodoRepositoryImpMock();
    when(() => repository(todo)).thenAnswer(
      (_) => Future.value(
        DefaultResponseModel(isSuccess: true, data: 1),
      ),
    );

    final useCase = AddTodoUsecaseImp(repository);
    final res = await useCase(todo);
    expect(res.isSuccess, true);
    expect(res.data, 1);
  });

  test('should add todo with error', () async {
    final todo = TodoEntity(
      id: 1,
      title: 'title',
      body: 'body',
    );
    final repository = AddTodoRepositoryImpMock();
    when(() => repository(todo)).thenAnswer(
      (_) => Future.value(
        DefaultResponseModel(isSuccess: false),
      ),
    );

    final useCase = AddTodoUsecaseImp(repository);
    final res = await useCase(todo);
    expect(res.isSuccess, false);
    expect(res.data, null);
  });
}
