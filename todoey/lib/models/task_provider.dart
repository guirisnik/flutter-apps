import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _taskList = [];

  void addTask({String text}) {
    final newTask = Task(text: text);
    _taskList.add(newTask);
    notifyListeners();
  }

  void deleteTask(int index) {
    _taskList.removeAt(index);
    notifyListeners();
  }

  int get numberOfTasks => _taskList.length;

  Task _getTask(int index) => _taskList[index];
  void toggleTask(int index) {
    _getTask(index).toggleCheckbox();
    notifyListeners();
  }

  String getTaskText(int index) => _taskList[index].text;
  bool getIsChecked(int index) => _taskList[index].isChecked;
}
