import '../entities/todo_entity.dart';

abstract class GetAllTodosRepository {
  Future<List<TodoEntity>> call();
}