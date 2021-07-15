import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/edit_task.dart';
import 'package:flutter_todo/pages/home.dart';
import 'package:flutter_todo/pages/add_task.dart';
import 'package:flutter_todo/pages/task_info.dart';

class App extends StatefulWidget {
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasks App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(title: 'Tasks'),
        '/add': (context) => AddTaskPage(),
        '/task': (context) => TaskInfoPage(),
        '/edit': (context) => EditTaskPage(),
      },
    );
  }
}
