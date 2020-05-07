import 'package:flutter/material.dart';


class DefaultTheme {
  static const Color clearSky = Color(0xFF78BCC5);
  static const Color clearGround = Color(0xFFE6E3C3);

  static const LinearGradient clearBackgroundGradient = LinearGradient(colors: [
    clearSky,
    clearGround,
  ]);

  static const Color nightSky = Color(0xFF222381);
  static const Color nightGround = Color(0xFF5C9FE2);

  static const LinearGradient nightBackgroundGradient = LinearGradient(colors: [
    nightSky,
    nightGround,
  ]);

  static const Color rainySky = Color(0xFF3D454F);
  static const Color rainyGround = Color(0xFFABACAE);

  static const LinearGradient rainyBackgroundGradient = LinearGradient(colors: [
    rainySky,
    rainyGround,
  ]);

  static const Color backgroundColor = Color(0xFF14161B);

  ThemeData get defaultTheme => ThemeData.dark().copyWith(
    backgroundColor: backgroundColor,
    dialogBackgroundColor: backgroundColor,
    scaffoldBackgroundColor: backgroundColor,
  );
}