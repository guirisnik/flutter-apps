import 'package:flutter/material.dart';
import 'package:clima/routes/loading_route.dart';
import 'package:clima/themes/default_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: DefaultTheme().defaultTheme,
      home: LoadingRoute(),
    );
  }
}
