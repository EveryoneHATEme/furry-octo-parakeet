import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './widgets/app.dart';
import './store/tasks.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TasksModel(),
      child: App(),
    ),
  );
}
