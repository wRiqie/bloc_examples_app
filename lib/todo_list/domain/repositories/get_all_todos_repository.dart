import 'package:bloc_app/todo_list/core/models/default_response_model.dart';
import 'package:bloc_app/todo_list/core/models/paginable_model.dart';

import '../entities/todo_entity.dart';

abstract class GetAllTodosRepository {
  Future<DefaultResponseModel<Paginable<TodoEntity>>> call(int page);
}