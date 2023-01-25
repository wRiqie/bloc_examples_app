import 'package:bloc_app/todo_list/core/models/default_response_model.dart';

import '../../entities/todo_entity.dart';
import '../../repositories/add_todo_repository.dart';
import 'add_todo_usecase.dart';

class AddTodoUsecaseImp implements AddTodoUsecase {
  final AddTodoRepository _addTodoRepository;

  AddTodoUsecaseImp(this._addTodoRepository);

  @override
  Future<DefaultResponseModel<int>> call(TodoEntity todo) => _addTodoRepository(todo);
}
