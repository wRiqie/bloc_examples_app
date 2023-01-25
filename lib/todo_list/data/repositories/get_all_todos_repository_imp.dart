import 'package:bloc_app/todo_list/data/datasources/get_all_todos_datasource.dart';

import '../../domain/entities/todo_entity.dart';
import '../../domain/repositories/get_all_todos_repository.dart';
import '../../shared/models/default_response_model.dart';
import '../dto/todo_dto.dart';

class GetAllTodosRepositoryImp implements GetAllTodosRepository {
  final GetAllTodosDataSource _getAllTodosDataSource;

  GetAllTodosRepositoryImp(this._getAllTodosDataSource);

  @override
  Future<DefaultResponseModel<List<TodoEntity>>> call() async {
    final items = await _getAllTodosDataSource();

    return DefaultResponseModel(
      isSuccess: true,
      data: items.map((e) => TodoDto.fromMap(e)).toList(),
    );
  }
}