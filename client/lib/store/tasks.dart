import 'dart:collection';

import 'package:flutter/foundation.dart';
import '../models/task.dart';

class TasksModel extends ChangeNotifier {
  final List<Task> _tasks = [];
  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  Task? get(int id) {
    try {
      return _tasks.firstWhere((element) => element.id == id);
    } on StateError {
      return null;
    }
  }

  void add(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void edit(int id, String name, String description) {
    final task = tasks.firstWhere((element) => element.id == id);
    task.name = name;
    task.description = description;
    notifyListeners();
  }

  void remove(int id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }
}
