import '../../entities/todo_entity.dart';

abstract class GetAllTodosUsecase {
  Future<List<TodoEntity>> call();
}