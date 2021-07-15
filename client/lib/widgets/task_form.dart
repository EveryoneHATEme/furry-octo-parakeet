import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../store/tasks.dart';

typedef OnComplete = void Function(
  TasksModel tasks,
  String name,
  String description,
);

class TaskForm extends StatefulWidget {
  final OnComplete? onComplete;
  final String submitLabel;

  final String initialName;
  final String initialDescription;

  TaskForm({
    Key? key,
    this.onComplete,
    required this.submitLabel,
    this.initialName = '',
    this.initialDescription = '',
  }) : super(key: key);

  @override
  State<TaskForm> createState() => _TaskFormState(
        onComplete: onComplete,
        submitLabel: submitLabel,
        name: initialName,
        description: initialDescription,
      );
}

class _TaskFormState extends State<TaskForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String name = '';
  String description = '';

  final OnComplete? onComplete;
  final String submitLabel;

  _TaskFormState({
    this.onComplete,
    required this.submitLabel,
    this.name = '',
    this.description = '',
  });

  String? emptyStringValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name can\'t be empty';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            initialValue: name,
            decoration: const InputDecoration(hintText: 'Task Name'),
            validator: emptyStringValidator,
            onChanged: (value) => setState(() => name = value),
          ),
          TextFormField(
            initialValue: description,
            decoration: const InputDecoration(hintText: 'Task Description'),
            validator: emptyStringValidator,
            onChanged: (value) => setState(() => description = value),
          ),
          Center(
            child: Consumer<TasksModel>(
              builder: (_, value, child) => ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (onComplete != null) {
                      onComplete!(value, this.name, this.description);
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text(submitLabel),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
