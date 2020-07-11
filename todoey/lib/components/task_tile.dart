import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String text;
  final bool isChecked;
  final void Function(bool value) toggleCheckboxCallback;
  final void Function() longPressCallback;

  TaskTile({
    @required this.text,
    this.isChecked,
    @required this.toggleCheckboxCallback,
    @required this.longPressCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 20.0,
          color: isChecked == true ? Colors.grey : Colors.black,
          decoration: isChecked == true ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: toggleCheckboxCallback,
      ),
    );
  }
}
