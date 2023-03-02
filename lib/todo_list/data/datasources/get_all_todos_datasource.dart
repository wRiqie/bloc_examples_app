import 'package:bloc_app/todo_list/domain/entities/todo_entity.dart';

abstract class GetAllTodosDataSource {
  Future<List<TodoEntity>> call(int page);
}