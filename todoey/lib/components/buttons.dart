import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final Icon icon;
  final Color color;
  final Function onPress;

  RoundIconButton({
    this.icon,
    this.color,
    @required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: icon != null
              ? icon
              : Icon(
                  Icons.list,
                  color: Colors.lightBlue.shade200,
                ),
        ),
        decoration: BoxDecoration(
          color: color != null ? color : Colors.white,
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
