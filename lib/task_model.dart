import 'dart:convert';

class TaskModel {
  String title;
  bool isCompleted;
  DateTime createdAt;

  TaskModel({
    required this.title,
    required this.isCompleted,
    required this.createdAt,
  });

  factory TaskModel.fromRawJson(String str) =>
      TaskModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        title: json["title"],
        isCompleted: json["is_completed"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "is_completed": isCompleted,
        "created_at": createdAt,
      };
}
