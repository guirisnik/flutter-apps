import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  static const heroTag = 'logo';
  final double size;

  Logo({ this.size });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('images/logo.png'),
      height: this.size != null ? this.size : 60.0,
    );
  }
}
