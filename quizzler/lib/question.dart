import 'package:meta/meta.dart';

class Question {
  final String _questionText;
  final bool _questionAnswer;

  Question({
    @required String text,
    @required bool answer
  }) :
    this._questionText = text,
    this._questionAnswer = answer;

  // getters
  String getQuestionText() => this._questionText;
  bool getQuestionAnswer() => this._questionAnswer;
}