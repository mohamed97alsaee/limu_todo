import 'package:flutter/material.dart';
import 'package:limu_todo/providers/tasks_provider.dart';
import 'package:limu_todo/task_model.dart';
import 'package:provider/provider.dart';

class AddingDialog extends StatefulWidget {
  const AddingDialog({super.key});

  @override
  State<AddingDialog> createState() => _AddingDialogState();
}

class _AddingDialogState extends State<AddingDialog> {
  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Add New Task!",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration:
                  const InputDecoration(hintText: "Add Task Title Here."),
              controller: titleController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      titleController.clear();
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel")),
                ElevatedButton(
                    onPressed: () {
                      if (titleController.text.isNotEmpty) {
                        Provider.of<TasksProvider>(context, listen: false)
                            .addNewTask(TaskModel(
                                title: titleController.text,
                                isCompleted: false,
                                createdAt: DateTime.now()));
                        titleController.clear();
                        Navigator.pop(context);
                        setState(() {});
                      }
                    },
                    child: const Text("ADD")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
