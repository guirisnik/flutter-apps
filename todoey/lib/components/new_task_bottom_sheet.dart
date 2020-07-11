import 'package:flutter/material.dart';

class NewTaskBottomSheet extends StatelessWidget {
  final TextEditingController newTaskController;
  final void Function({String taskText}) addTaskCallback;

  NewTaskBottomSheet({
    @required this.newTaskController,
    @required this.addTaskCallback,
  });

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          top: 20.0,
          bottom: MediaQuery.of(context).viewInsets.bottom + 60.0,
          left: 30.0,
          right: 30.0,
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: newTaskController,
                autofocus: true,
              ),
              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                color: Colors.lightBlueAccent,
                onPressed: () {
                  final String taskText = newTaskController.value.text;

                  if (taskText != null && taskText != '')
                    addTaskCallback(taskText: taskText);

                  newTaskController.clear();
                },
                child: Text(
                  'Add task',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
