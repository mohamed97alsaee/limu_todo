import 'package:flutter/material.dart';
import 'package:limu_todo/task_model.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.taskModel, required this.onTap});
  final TaskModel taskModel;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(taskModel.title),
      trailing: Checkbox(
        value: taskModel.isCompleted,
        onChanged: (value) {
          onTap();
        },
      ),
    );
  }
}
