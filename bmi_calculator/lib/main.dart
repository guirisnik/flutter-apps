import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bmi_calculator/landing_page.dart';
import 'package:bmi_calculator/default_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String appTitle = 'BMI Calculator';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      title: appTitle,
      theme: DefaultTheme().defaultTheme,
      home: LandingPage(),
    );
  }
}
