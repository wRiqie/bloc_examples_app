import '../../core/models/default_response_model.dart';

abstract class DeleteTodoByIdRepository {
  Future<DefaultResponseModel<int>> call(int id);
}