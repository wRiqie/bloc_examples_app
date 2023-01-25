import 'package:bloc_app/todo_list/domain/entities/todo_entity.dart';
import 'package:bloc_app/todo_list/core/models/default_response_model.dart';

abstract class AddTodoUsecase {
  Future<DefaultResponseModel> call(TodoEntity todo);
} 