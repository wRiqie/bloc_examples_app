class TodoEntity {
  int id;
  String title;
  String body;
  DateTime createdAt;

  TodoEntity({
    required this.id,
    required this.title,
    required this.body,
    required this.createdAt,
  });
}
