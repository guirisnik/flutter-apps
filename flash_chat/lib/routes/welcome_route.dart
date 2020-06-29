import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/components/buttons.dart';
import 'package:flash_chat/components/logo.dart';
import 'registration_route.dart';
import 'login_route.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeRoute extends StatefulWidget {
  static const routeName = '/';

  @override
  _WelcomeRouteState createState() => _WelcomeRouteState();
}

class _WelcomeRouteState extends State<WelcomeRoute>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    animation = ColorTween(
      begin: Colors.grey.shade400,
      end: Colors.white,
    ).animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: animation.value,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 70.0),
              child: Row(
                children: [
                  Hero(
                    tag: Logo.heroTag,
                    child: Logo(),
                  ),
                  TypewriterAnimatedTextKit(
                    isRepeatingAnimation: false,
                    speed: Duration(milliseconds: 400),
                    text: [APP_NAME],
                    textStyle: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: PillButton(
                onPress: () =>
                    Navigator.pushNamed(context, LoginRoute.routeName),
                label: 'Log In',
                color: Colors.lightBlue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: PillButton(
                onPress: () =>
                    Navigator.pushNamed(context, RegistrationRoute.routeName),
                label: 'Register',
                color: Colors.blue.shade700,
              ),
            ),
          ],
        ));
  }
}
