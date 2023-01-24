import 'package:bloc_app/todo_list/domain/repositories/delete_todo_by_id_repository.dart';
import 'package:bloc_app/todo_list/domain/useCases/delete_todo_by_id/delete_todo_by_id_usecase.dart';

import '../../../shared/models/default_response_model.dart';

class DeleteTodoByIdUsecaseImp implements DeleteTodoByIdUsecase {
  final DeleteTodoByIdRepository _deleteTodoByIdRepository;

  DeleteTodoByIdUsecaseImp(this._deleteTodoByIdRepository); 

  @override
  Future<DefaultResponseModel<int>> call(int id) => _deleteTodoByIdRepository(id);
}