import 'package:bloc_app/todo_list/domain/entities/todo_entity.dart';

abstract class AddTodoUsecase {
  Future<int> call(TodoEntity todo);
} 