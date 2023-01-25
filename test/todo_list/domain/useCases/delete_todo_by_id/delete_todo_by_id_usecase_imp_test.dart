import 'package:bloc_app/todo_list/domain/repositories/delete_todo_by_id_repository.dart';
import 'package:bloc_app/todo_list/domain/useCases/delete_todo_by_id/delete_todo_by_id_usecase_imp.dart';
import 'package:bloc_app/todo_list/shared/models/default_response_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DeleteTodoByIdRepositoryImpMock extends Mock
    implements DeleteTodoByIdRepository {}

void main() {
  test('should delete todo by id with success', () async {
    final repository = DeleteTodoByIdRepositoryImpMock();
    when(
      () => repository(any()),
    ).thenAnswer(
      (_) => Future.value(
        DefaultResponseModel(
          isSuccess: true,
          data: 1,
        ),
      ),
    );
    final useCase = DeleteTodoByIdUsecaseImp(repository);
    final res = await useCase(1);
    expect(res.isSuccess, true);
    expect(res.data, 1);
  });

  test('should delete todo by id with error', () async {
    final repository = DeleteTodoByIdRepositoryImpMock();
    when(
      () => repository(any()),
    ).thenAnswer(
      (_) => Future.value(
        DefaultResponseModel(
          isSuccess: false,
        ),
      ),
    );
    final useCase = DeleteTodoByIdUsecaseImp(repository);
    final res = await useCase(1);
    expect(res.isSuccess, false);
    expect(res.data, null);
  });
}
