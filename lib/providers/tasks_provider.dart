import '../task_model.dart';

import 'package:flutter/material.dart';

class TasksProvider with ChangeNotifier {
  List<TaskModel> completedTasks = [];
  List<TaskModel> inProgressTasks = [];

  addNewTask(TaskModel tm) {
    inProgressTasks.add(tm);
    notifyListeners();
  }
}
