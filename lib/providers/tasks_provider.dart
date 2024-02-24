import '../task_model.dart';

import 'package:flutter/material.dart';

class TasksProvider with ChangeNotifier {
  List<TaskModel> completedTasks = [];
  List<TaskModel> inProgressTasks = [];

  addNewTask(TaskModel tm) {
    inProgressTasks.add(tm);
    notifyListeners();
  }

  switchTask(TaskModel tm) {
    if (tm.isCompleted) {
      tm.isCompleted = !tm.isCompleted;
      inProgressTasks.add(tm);
      completedTasks.remove(tm);
      notifyListeners();
    } else {
      tm.isCompleted = !tm.isCompleted;
      completedTasks.add(tm);
      inProgressTasks.remove(tm);
      notifyListeners();
    }
  }
}
