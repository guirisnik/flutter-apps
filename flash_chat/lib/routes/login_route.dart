import 'package:flutter/material.dart';
import 'package:flash_chat/components/input.dart';
import 'package:flash_chat/components/buttons.dart';
import 'package:flash_chat/components/logo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'chat_route.dart';

class LoginRoute extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  final _auth = FirebaseAuth.instance;
  bool isSubmitting = false;
  String email;
  String password;

  void setEmail(value) {
    setState(() {
      email = value;
    });
  }

  void setPassword(value) {
    setState(() {
      password = value;
    });
  }

  void setSubmitting(bool value) {
    setState(() {
      isSubmitting = value;
    });
  }

  void enterChat() async {
    setSubmitting(true);
    final user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    if (user != null) await Navigator.pushNamed(context, ChatRoute.routeName);
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
                onPress: enterChat,
                label: 'Log In',
                isSubmitting: isSubmitting,
              )
            ],
          ),
        ),
      ),
    );
  }
}
