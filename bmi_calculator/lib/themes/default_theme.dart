import 'package:flutter/material.dart';

class DefaultTheme {
  final BuildContext context;

  DefaultTheme({ this.context });

  static const Color defaultThemeColor = Color(0xFF0A0E21);
  static const Color defaultCardColor = Color(0xFF1D1E33);
  static const Color defaultButtonColor = Color(0xFFEB1555);
  static const Color buttonSelectedColor = Color(0xFF1D1E33);
  static const Color buttonDeselectedColor = Color(0xFF111328);
  static const Color inactiveSliderTrackColor = Color(0XFF8D8E98);
  static const Color defaultSliderOverlayColor = Color(0x29EB1555);
  static const Color defaultRoundButtonColor = Color(0xFF4C4F5E);

  // The keyword get is used to define a getter, instead of having to write a
  // method for it. The same applies to set
  ThemeData get defaultTheme => ThemeData.dark().copyWith(
        primaryColor: defaultThemeColor,
        scaffoldBackgroundColor: defaultThemeColor,
        textTheme: TextTheme(
          body1: TextStyle(
            color: Colors.white70,
          ),
          body2: TextStyle(
            color: Colors.white70,
          ),
        ),
        cardColor: defaultCardColor,
      );

  SliderThemeData get defaultSliderTheme => SliderTheme.of(this.context).copyWith(
    thumbShape: RoundSliderThumbShape(
      enabledThumbRadius: 11,
    ),
    overlayShape: RoundSliderOverlayShape(
      overlayRadius: 25,
    ),
    overlayColor: defaultSliderOverlayColor,
    thumbColor: defaultButtonColor,
    activeTrackColor: Colors.white70,
    inactiveTrackColor: inactiveSliderTrackColor
  );

  TextStyle get defaultBottomButtonTextStyle => TextStyle(
    fontSize: 25,
    color: Colors.white,
    fontWeight: FontWeight.bold
  );

  TextStyle get defaultTextStyle => TextStyle(
    fontSize: 20,
    color: Colors.white70,
  );

  TextStyle get defaultValueTextStyle => TextStyle(
    fontSize: 45,
    color: Colors.white70,
    fontWeight: FontWeight.bold,
  );
}
