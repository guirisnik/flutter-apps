import 'package:flutter/material.dart';
import 'package:bmi_calculator/default_theme.dart';

class RoundIconButton extends StatelessWidget {
  final Function onPressed;
  final ShapeBorder shape;
  final IconData icon;
  final Color fillColor;

  RoundIconButton({
    @required this.onPressed,
    this.fillColor,
    this.shape,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: this.onPressed,
      shape: this.shape != null ? this.shape : CircleBorder(side: BorderSide.none),
      child: Icon(icon),
      fillColor: this.fillColor != null ? this.fillColor : Colors.amber,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  BottomButton({ this.label, @required this.onPressed });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.only(bottom: 15),
      child: Text(
        label != null ? label : '',
        style: DefaultTheme().defaultBottomButtonTextStyle,
      ),
      color: DefaultTheme.defaultButtonColor,
      onPressed: this.onPressed
    );
  }
}