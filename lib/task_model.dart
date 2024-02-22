class TaskModel {
  String title;
  bool isCompleted;
  DateTime createdAt;
  TaskModel({
    required this.title,
    required this.createdAt,
    this.isCompleted = false,
  });
}
