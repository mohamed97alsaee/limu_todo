import 'package:limu_todo/providers/tasks_provider.dart';
import 'package:limu_todo/widgets/adding_dialog.dart';
import 'package:limu_todo/widgets/task_card.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    debugPrint("HELLO");
    super.initState();
  }

  @override
  void dispose() {
    debugPrint("BYE");

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(builder: (context, tasksCosumer, _) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("LIMU TODO"),
        ),
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              const TabBar(
                labelColor: Colors.black,
                tabs: [Tab(text: "In Progress"), Tab(text: "Completed")],
              ),
              Expanded(
                child: TabBarView(children: [
                  Center(
                    child: tasksCosumer.inProgressTasks.isEmpty
                        ? const Text(
                            "You dont have any tasks yet.",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        : ListView.builder(
                            itemCount: tasksCosumer.inProgressTasks.length,
                            itemBuilder: (context, index) {
                              return TaskCard(
                                  taskModel:
                                      tasksCosumer.inProgressTasks[index],
                                  onTap: () {
                                    // inProgressTasks[index].isCompleted =
                                    //     !inProgressTasks[index].isCompleted;
                                    // completedTasks.add(inProgressTasks[index]);
                                    // inProgressTasks
                                    //     .remove(inProgressTasks[index]);
                                    // setState(() {});
                                    Provider.of<TasksProvider>(context,
                                            listen: false)
                                        .switchTask(tasksCosumer
                                            .inProgressTasks[index]);
                                  });
                            },
                          ),
                  ),
                  Center(
                    child: tasksCosumer.completedTasks.isEmpty
                        ? const Text(
                            "You dont have any tasks yet.",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        : ListView.builder(
                            itemCount: tasksCosumer.completedTasks.length,
                            itemBuilder: (context, index) {
                              return TaskCard(
                                  taskModel: tasksCosumer.completedTasks[index],
                                  onTap: () {
                                    Provider.of<TasksProvider>(context,
                                            listen: false)
                                        .switchTask(
                                            tasksCosumer.completedTasks[index]);
                                  });
                            },
                          ),
                  ),
                ]),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return const AddingDialog();
                });
          },
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
