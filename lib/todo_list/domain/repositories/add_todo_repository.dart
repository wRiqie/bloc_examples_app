import 'package:bloc_app/todo_list/domain/entities/todo_entity.dart';
import 'package:bloc_app/todo_list/shared/models/default_response_model.dart';

abstract class AddTodoRepository {
  Future<DefaultResponseModel<int>> call(TodoEntity todo);
}