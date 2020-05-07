import 'package:flutter/material.dart';


class DefaultTheme {
  static const Color backgroundColor = Color(0xFF131E25);


  ThemeData get defaultTheme => ThemeData.dark().copyWith(
    backgroundColor: backgroundColor,
    scaffoldBackgroundColor: backgroundColor,
    dialogBackgroundColor: backgroundColor,
  );
}