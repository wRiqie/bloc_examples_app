import 'package:bloc_app/todo_list/data/repositories/delete_todo_by_id_repository_imp.dart';
import 'package:bloc_app/todo_list/domain/repositories/delete_todo_by_id_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late DeleteTodoByIdRepository repository;
  setUp(() {
    repository = DeleteTodoByIdRepositoryImp();
  });

  test('should delete a todo with id 1', () async {
    final res = await repository(1);

    expect(res.isSuccess, true);
    expect(res.data, 1);
  });
}
