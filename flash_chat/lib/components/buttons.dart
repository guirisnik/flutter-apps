import 'package:flutter/material.dart';

class PillButton extends StatelessWidget {
  final Function onPress;
  final Color color;
  final String label;
  final Color textColor;

  PillButton({
    @required this.onPress,
    this.label,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Container(
        decoration: BoxDecoration(
          color: this.color != null ? this.color : Colors.lightBlue,
          borderRadius: BorderRadius.circular(50.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(4.0, 4.0),
              blurRadius: 4.0,
            )
          ]
        ),
        padding: EdgeInsets.all(13.0),
        child: Text(
          this.label != null ? this.label : '',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
            color: this.textColor != null ? this.textColor : Colors.white,
          )
        ),
      ),
    );
  }
}