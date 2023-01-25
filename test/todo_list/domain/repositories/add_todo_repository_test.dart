import 'package:bloc_app/todo_list/data/repositories/add_todo_repository_imp.dart';
import 'package:bloc_app/todo_list/domain/entities/todo_entity.dart';
import 'package:bloc_app/todo_list/domain/repositories/add_todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AddTodoRepository repository;
  
  setUp(() {
    repository = AddTodoRepositoryImp();
  });

  test('should return 1 when save a todo', () async {
    final todoToAdd = TodoEntity(
      body: '',
      id: 1,
      title: '',
    );
    final res = await repository(todoToAdd);

    expect(res.isSuccess, true);
    expect(res.data, 1);
  });
}
