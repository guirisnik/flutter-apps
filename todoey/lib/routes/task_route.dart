import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/components/task_list.dart';
import 'package:todoey/components/header.dart';
import 'package:todoey/components/new_task_bottom_sheet.dart';
import 'package:todoey/models/task_provider.dart';

class TaskRoute extends StatefulWidget {
  @override
  _TaskRouteState createState() => _TaskRouteState();
}

class _TaskRouteState extends State<TaskRoute> {
  TextEditingController _newTaskController;

  @override
  void initState() {
    super.initState();
    _newTaskController = TextEditingController();
  }

  void addTask({String taskText}) {
    Provider.of<TaskProvider>(context, listen: false).addTask(text: taskText);

    Navigator.pop(context);
  }

  void showNewTaskDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: NewTaskBottomSheet(
              newTaskController: _newTaskController, addTaskCallback: addTask)
          .build,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: showNewTaskDialog,
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
          size: 35.0,
        ),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 20.0, left: 40.0),
              child: Header(
                numberOfTasks: Provider.of<TaskProvider>(context).numberOfTasks,
              ),
            ),
          ),
          Expanded(
            child: TaskList(),
          ),
        ],
      ),
    );
  }
}
