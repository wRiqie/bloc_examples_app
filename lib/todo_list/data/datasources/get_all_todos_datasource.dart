import 'package:bloc_app/todo_list/core/models/paginable_model.dart';
import 'package:bloc_app/todo_list/domain/entities/todo_entity.dart';

abstract class GetAllTodosDataSource {
  Future<Paginable<TodoEntity>> call(int page);
}