import 'package:flutter/material.dart';
import 'package:flash_chat/components/input.dart';
import 'package:flash_chat/components/buttons.dart';
import 'package:flash_chat/components/logo.dart';

class RegistrationRoute extends StatefulWidget {
  static const routeName = '/register';

  @override
  _RegistrationRouteState createState() => _RegistrationRouteState();
}

class _RegistrationRouteState extends State<RegistrationRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: Logo.heroTag,
              child: Logo(size: 200.0,),
            ),
            SizedBox(height: 20.0,),
            Input(placeholder: 'Username',),
            SizedBox(height: 10.0,),
            Input(placeholder: 'Password', hideText: true,),
            SizedBox(height: 25.0,),
            PillButton(
              onPress: () {
                print('I got pressed!!!');
              },
              color: Colors.blue.shade700,
              label: 'Register',
            )
          ],
        ),
      ),
    );
  }
}