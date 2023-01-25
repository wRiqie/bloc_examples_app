import 'package:hive/hive.dart';

part 'todo_entity.g.dart';

// Pode ter lógica
@HiveType(typeId: 1)
class TodoEntity {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String body;

  TodoEntity({
    this.id,
    required this.title,
    required this.body,
  });
}
