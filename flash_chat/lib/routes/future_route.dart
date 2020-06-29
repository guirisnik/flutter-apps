import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'welcome_route.dart';
import 'chat_route.dart';

class FutureRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseAuth.instance.currentUser(),
      builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) =>
        snapshot.hasData ? WelcomeRoute() : ChatRoute()
    );
  }
}