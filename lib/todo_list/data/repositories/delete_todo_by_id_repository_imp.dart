import '../../domain/repositories/delete_todo_by_id_repository.dart';
import '../../core/models/default_response_model.dart';

class DeleteTodoByIdRepositoryImp implements DeleteTodoByIdRepository {
  @override
  Future<DefaultResponseModel<int>> call(int id) async {
    // delete with api
    var res = 1;
    return DefaultResponseModel(
      isSuccess: true,
      data: res,
    );
  }
}