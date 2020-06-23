import 'package:flash_chat/routes/welcome_route.dart';
import 'package:flash_chat/routes/registration_route.dart';
import 'package:flash_chat/routes/login_route.dart';
import 'package:flash_chat/routes/chat_route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: WelcomeRoute.routeName,
      routes: <String, WidgetBuilder>{
        WelcomeRoute.routeName: (BuildContext context) => WelcomeRoute(),
        LoginRoute.routeName: (BuildContext context) => LoginRoute(),
        RegistrationRoute.routeName: (BuildContext context) => RegistrationRoute(),
        ChatRoute.routeName: (BuildContext context) => ChatRoute(),
      },
    );
  }
}
