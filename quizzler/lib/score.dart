import 'package:flutter/material.dart' show Icon, Icons, Colors;

class Score {
  List<Icon> _scoreKeeper = [];

  final Icon _right = Icon(Icons.check, color: Colors.green,);
  final Icon _wrong = Icon(Icons.close, color: Colors.red,);

  void addRight() {
    _scoreKeeper.add(_right);
  }

  void addWrong() {
    _scoreKeeper.add(_wrong);
  }

  int getRightAnswers() {
    int rightAnswers = 0;

    _scoreKeeper.forEach((answer) {
      rightAnswers += (answer == _right) ? 1 : 0;
    });

    return rightAnswers;
  }

  void resetScore() {
    _scoreKeeper.clear();
  }

  List<Icon> getScore() => _scoreKeeper;
}