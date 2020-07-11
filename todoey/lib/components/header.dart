import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final int numberOfTasks;

  Header({this.numberOfTasks});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 30.0,
          child: Icon(
            Icons.list,
            color: Colors.lightBlueAccent,
            size: 40.0,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Todoey',
              style: TextStyle(
                fontSize: 50.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$numberOfTasks tasks',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
