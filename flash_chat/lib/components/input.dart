import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final Color color;
  final String placeholder;
  final double borderWidth;
  final bool hideText;

  Input({ 
    this.color,
    this.placeholder,
    this.borderWidth,
    this.hideText,
  });
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: this.hideText != null ? this.hideText : false,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 15.0,
      ),
      cursorColor: this.color != null ? this.color : Colors.lightBlue,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(
            color: this.color != null ? this.color : Colors.lightBlue,
            width: this.borderWidth != null ? this.borderWidth : 2.0,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(
            color: this.color != null ? this.color : Colors.lightBlue,
            width: this.borderWidth != null ? this.borderWidth : 2.0,
          ),
        ),
        hintText: this.placeholder != null ? this.placeholder : '',
      )
    );
  }
}
