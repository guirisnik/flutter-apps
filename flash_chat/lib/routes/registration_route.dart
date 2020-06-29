import 'package:flutter/material.dart';
import 'package:flash_chat/components/input.dart';
import 'package:flash_chat/components/buttons.dart';
import 'package:flash_chat/components/logo.dart';
import 'chat_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loading_overlay/loading_overlay.dart';

class RegistrationRoute extends StatefulWidget {
  static const routeName = '/register';

  @override
  _RegistrationRouteState createState() => _RegistrationRouteState();
}

class _RegistrationRouteState extends State<RegistrationRoute> {
  final _auth = FirebaseAuth.instance;
  bool isSubmitting = false;
  String email;
  String password;

  void setEmail(String value) {
    setState(() {
      email = value;
    });
  }

  void setPassword(String value) {
    setState(() {
      password = value;
    });
  }

  void setSubmitting(bool value) {
    setState(() {
      isSubmitting = value;
    });
  }

  void register() async {
    setSubmitting(true);
    final newUser = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (newUser != null)
      await Navigator.pushNamed(context, ChatRoute.routeName);
    setSubmitting(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingOverlay(
        isLoading: isSubmitting,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Hero(
                  tag: Logo.heroTag,
                  child: Logo(
                    size: 200.0,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Input(
                onChange: setEmail,
                placeholder: 'Email',
              ),
              SizedBox(
                height: 10.0,
              ),
              Input(
                onChange: setPassword,
                placeholder: 'Password',
                hideText: true,
              ),
              SizedBox(
                height: 25.0,
              ),
              PillButton(
                onPress: register,
                color: Colors.blue.shade700,
                label: 'Register',
                isSubmitting: isSubmitting,
              )
            ],
          ),
        ),
      ),
    );
  }
}
