import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_form.dart';

class EditTaskPage extends StatelessWidget {
  late final Task task;
  EditTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    task = ModalRoute.of(context)!.settings.arguments as Task;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: TaskForm(
          submitLabel: 'Edit',
          onComplete: (tasks, name, description) => tasks.edit(
            task.id,
            name,
            description,
          ),
          initialName: task.name,
          initialDescription: task.description,
        ),
      ),
    );
  }
}
