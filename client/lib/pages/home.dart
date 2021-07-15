import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../store/tasks.dart';
import '../widgets/task_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Consumer<TasksModel>(
          builder: (_, tasks, child) => ListView.separated(
            padding: const EdgeInsets.all(8),
            scrollDirection: Axis.vertical,
            itemCount: tasks.tasks.length,
            separatorBuilder: (_, __) => Divider(),
            itemBuilder: (_, int index) => TaskWidget(
              task: tasks.tasks[index],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/add'),
        tooltip: 'Add task',
        child: Icon(Icons.add_task),
      ),
    );
  }
}
