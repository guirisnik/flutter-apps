import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'routes/task_route.dart';
import 'models/task_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskProvider>(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        theme: ThemeData.light(),
        home: TaskRoute(),
      ),
    );
  }
}
