import '../../domain/entities/todo_entity.dart';
import '../../domain/repositories/add_todo_repository.dart';
import '../../core/models/default_response_model.dart';

class AddTodoRepositoryImp implements AddTodoRepository {
  @override
  Future<DefaultResponseModel<int>> call(TodoEntity todo) async {
    // Envio à api
    var res = 1;

    return DefaultResponseModel(
      isSuccess: true,
      data: res,
    );
  }
}