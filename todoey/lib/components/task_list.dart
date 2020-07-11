import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_provider.dart';
import 'task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) => ListView.builder(
          itemCount: taskProvider.numberOfTasks,
          itemBuilder: (context, index) => TaskTile(
            text: taskProvider.getTaskText(index),
            isChecked: taskProvider.getIsChecked(index),
            toggleCheckboxCallback: (bool value) =>
                taskProvider.toggleTask(index),
            longPressCallback: () => taskProvider.deleteTask(index),
          ),
        ),
      ),
    );
  }
}
