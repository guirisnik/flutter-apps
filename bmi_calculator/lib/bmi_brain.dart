import 'dart:math';
import 'package:flutter/material.dart' show Colors, Color;

const int DECIMAL_PLACES = 1;

class BMIBrain {
  BMIBrain({ this.height, this.weight }) {
    _bmi = this.weight / pow(this.height / 100, 2);

    if (_bmi >= 25) {
      _resultScale = 'Overweight';
      _colorScale = Colors.red;
      _resultOrientation =
        'You have a higher than normal body weight. Try and exercise more.';
    } else if (_bmi > 18.5) {
      _resultScale = 'Normal';
      _colorScale = Colors.green;
      _resultOrientation = 'You have a normal body weight. Good job!';
    } else {
      _resultScale = 'Underweight';
      _colorScale = Colors.yellow;
      _resultOrientation =
        'You have a lower than normal body weight. You can eat a bit more';
    }
  }

  final double height;
  final double weight;

  double _bmi;
  String _resultScale;
  String _resultOrientation;
  Color _colorScale;

  String get bmi => this._bmi.toStringAsFixed(DECIMAL_PLACES);

  String get resultScale => this._resultScale;

  String get resultOrientation => this._resultOrientation;

  Color get colorScale => this._colorScale;
}