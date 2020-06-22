import 'package:flutter/material.dart';
import 'package:flash_chat/components/input.dart';
import 'package:flash_chat/components/buttons.dart';

class LoginRoute extends StatefulWidget {
  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Image.asset('images/logo.png'),
              height: 250.0,
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
              label: 'Log In',
            )
          ],
        ),
      ),
    );
  }
}