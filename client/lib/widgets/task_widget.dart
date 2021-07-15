import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskWidget extends StatelessWidget {
  final Task task;

  TaskWidget({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.name),
      subtitle: Text(task.description),
      trailing: IconButton(
        icon: const Icon(Icons.chevron_right),
        onPressed: () => Navigator.pushNamed(
          context,
          '/task',
          arguments: task.id,
        ),
      ),
    );
  }
}
