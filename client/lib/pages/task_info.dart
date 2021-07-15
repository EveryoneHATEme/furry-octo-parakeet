import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task.dart';
import '../store/tasks.dart';

class TaskInfoPage extends StatelessWidget {
  TaskInfoPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final int id = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(),
      body: Consumer<TasksModel>(
        builder: (_, tasks, child) {
          Task? task = tasks.get(id);
          if (task == null) {
            return Center();
          }
          return Card(
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.task_alt),
                  title: Text(task.name),
                  subtitle: Text(task.description),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        '/edit',
                        arguments: task,
                      ),
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        tasks.remove(id);
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
