import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_form.dart';

class AddTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
            padding: EdgeInsets.all(8),
            child: TaskForm(
              submitLabel: 'Create',
              onComplete: (tasks, name, description) =>
                  tasks.add(Task(name, description)),
            )),
      ),
    );
  }
}
