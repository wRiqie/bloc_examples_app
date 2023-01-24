import 'package:bloc_app/todo_list/shared/models/default_response_model.dart';

abstract class DeleteTodoByIdUsecase {
  Future<DefaultResponseModel<int>> call(int id);
}