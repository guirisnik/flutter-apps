import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const _APP_TITLE = 'Magic 8 Ball';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _APP_TITLE,
      color: Colors.blue.shade900,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            _APP_TITLE,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.blue.shade900,
        body: Center(
          child: MagicBall(),
        ),
      )
    );
  }
}

class MagicBall extends StatefulWidget {
  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  var ballNumber = 1;
  static const _MAX_BALL_NUMBER = 5;

  void onMagicBallPress() {
    setState(() {
      this.ballNumber = Random().nextInt(_MAX_BALL_NUMBER) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: () => this.onMagicBallPress(),
        highlightColor: Colors.blue.shade900,
        child: Image(
          image: AssetImage('images/ball$ballNumber.png'),
        ),
      ),
    );
  }
}