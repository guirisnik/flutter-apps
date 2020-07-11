import 'package:flutter/material.dart';

class Task {
  final String text;
  bool isChecked;

  Task({@required this.text, this.isChecked = false});

  void toggleCheckbox() {
    isChecked = !isChecked;
  }
}
