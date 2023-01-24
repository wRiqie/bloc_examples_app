import 'package:bloc_app/todo_list/domain/repositories/delete_todo_by_id_repository.dart';
import 'package:bloc_app/todo_list/domain/useCases/delete_todo_by_id/delete_todo_by_id_usecase.dart';

class DeleteTodoByIdUsecaseImp implements DeleteTodoByIdUsecase {
  final DeleteTodoByIdRepository _deleteTodoByIdRepository;

  DeleteTodoByIdUsecaseImp(this._deleteTodoByIdRepository); 

  @override
  Future<int> call(int id) => _deleteTodoByIdRepository(id);
}