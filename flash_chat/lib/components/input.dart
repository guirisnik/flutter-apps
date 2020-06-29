import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final Function onChange;
  final Color color;
  final String placeholder;
  final double borderWidth;
  final bool hideText;
  final TextAlign textAlign;
  final bool multiLine;
  final TextInputType textInputType;
  final TextEditingController controller;

  Input({ 
    this.onChange,
    this.color,
    this.placeholder,
    this.borderWidth,
    this.hideText,
    this.textAlign,
    this.multiLine,
    this.textInputType,
    this.controller,
  });
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.controller,
      keyboardType: this.textInputType != null ? this.textInputType : TextInputType.emailAddress,
      onChanged: this.onChange,
      maxLines: this.multiLine == true ? null : 1,
      obscureText: this.hideText != null ? this.hideText : false,
      textAlign: this.textAlign != null ? this.textAlign : TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
      cursorColor: this.color != null ? this.color : Colors.lightBlue,
      decoration: InputDecoration(
        isDense: this.multiLine,
        contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: this.color != null ? this.color : Colors.lightBlue,
            width: this.borderWidth != null ? this.borderWidth : 3.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: this.color != null ? this.color : Colors.lightBlue,
            width: this.borderWidth != null ? this.borderWidth : 1.0,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: this.color != null ? this.color : Colors.lightBlue,
            width: this.borderWidth != null ? this.borderWidth : 1.0,
          ),
        ),
        hintText: this.placeholder != null ? this.placeholder : '',
      )
    );
  }
}
