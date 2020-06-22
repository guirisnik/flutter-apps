import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/components/buttons.dart';
import 'login_route.dart';

class WelcomeRoute extends StatefulWidget {
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
              ImageIcon(
                AssetImage('images/logo.png'), 
                color: Colors.amber, 
                size: 50.0,
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
              onPress: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => LoginRoute()
                  )
                );
              },
              label: 'Log In',
              color: Colors.lightBlue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: PillButton(
              onPress: () {
                print('Register');
              },
              label: 'Register',
              color: Colors.blue.shade700,
            ),
          ),
        ],
      )
    );
  }
}