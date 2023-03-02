import 'package:bloc_app/todo_list/core/models/default_response_model.dart';

import '../../entities/todo_entity.dart';

abstract class GetAllTodosUsecase {
  Future<DefaultResponseModel<List<TodoEntity>>> call(int page);
}