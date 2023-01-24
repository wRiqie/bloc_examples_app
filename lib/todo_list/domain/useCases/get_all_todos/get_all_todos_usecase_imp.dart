import '../../../shared/models/default_response_model.dart';
import '../../entities/todo_entity.dart';
import '../../repositories/get_all_todos_repository.dart';
import 'get_all_todos_usecase.dart';

class GetAllTodosUsecaseImp implements GetAllTodosUsecase {
  final GetAllTodosRepository _getAllTodosRepository;

  GetAllTodosUsecaseImp(this._getAllTodosRepository);

  @override
  Future<DefaultResponseModel<List<TodoEntity>>> call() => _getAllTodosRepository();
}
