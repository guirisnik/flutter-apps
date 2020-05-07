import 'constants.dart';
import 'package:flutter/material.dart';
import 'package:genesis_vision_design/themes/default_theme.dart';
import 'package:genesis_vision_design/routes/example_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      theme: DefaultTheme().defaultTheme,
      home: Scaffold(
        body: SafeArea(
          child: Center(child: ExampleRoute())
        ),
      ),
    );
  }
}
