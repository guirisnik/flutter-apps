import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstRoute(),
    );
  }
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
        backgroundColor: Colors.amber.shade600,
      ),

      backgroundColor: Colors.blueGrey.shade900,

      body: Center(
        child: RaisedButton(
          child: Text('Take me to Second Route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute())
            );
          },
        ),
      ),
    );
  }
}
class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Route'),
        backgroundColor: Colors.purple,
      ),

      backgroundColor: Colors.red,

      body: Center(
        child: RaisedButton(
          child: Text('Take me back'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
