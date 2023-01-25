import 'package:bloc_app/todo_list/core/models/default_response_model.dart';

abstract class DeleteTodoByIdUsecase {
  Future<DefaultResponseModel<int>> call(int id);
}