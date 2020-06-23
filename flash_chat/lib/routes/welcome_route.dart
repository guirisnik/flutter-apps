import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/components/buttons.dart';
import 'package:flash_chat/components/logo.dart';
import 'registration_route.dart';
import 'login_route.dart';
import 'chat_route.dart';

class WelcomeRoute extends StatefulWidget {
  static const routeName = '/';

  @override
  _WelcomeRouteState createState() => _WelcomeRouteState();
}

class _WelcomeRouteState extends State<WelcomeRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: Logo.heroTag,
                child: Logo(),
              ),
              Text(
                APP_NAME,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: PillButton(
              onPress: () => Navigator.pushNamed(context, LoginRoute.routeName),
              label: 'Log In',
              color: Colors.lightBlue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: PillButton(
              onPress: () => Navigator.pushNamed(context, RegistrationRoute.routeName),
              label: 'Register',
              color: Colors.blue.shade700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: PillButton(
              onPress: () => Navigator.pushNamed(context, ChatRoute.routeName),
              label: 'Chat',
              color: Colors.amber,
            ),
          ),
        ],
      )
    );
  }
}