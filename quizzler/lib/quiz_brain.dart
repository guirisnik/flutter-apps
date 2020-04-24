import 'package:flutter/material.dart' show
  BuildContext,
  Text,
  TextStyle,
  Navigator,
  Colors;
import 'package:rflutter_alert/rflutter_alert.dart';
import 'question.dart';
import 'score.dart';

class QuizBrain {
  Score scoreKeeper;

  QuizBrain({ Score score }) {
    this.scoreKeeper = score;
  }

  List<Question> _questions = [
    Question(text: 'You can lead a cow down stairs but not up stairs.', answer: false),
    Question(text: 'Approximately one quarter of human bones are in the feet.', answer: true),
    Question(text: 'A slug\'s blood is green.', answer: false),
  ];

  int _currentQuestion = 0;

  bool _currentAnswer = true;

  void _setScore() {
    if (_questions[_currentQuestion].getQuestionAnswer() == _currentAnswer) {
      scoreKeeper.addRight();
    } else {
      scoreKeeper.addWrong();
    }
  }

  void _setCurrentQuestion() {
    _currentQuestion++;
  }

  void _setCurrentAnswer(bool answer) {
    _currentAnswer = answer;
  }

  Question getCurrentQuestion() => _questions[_currentQuestion];

  void _resetQuiz() {
    _currentAnswer = true;
    _currentQuestion = 0;
    scoreKeeper.resetScore();
  }

  _onBasicAlertPressed(context) {
    int rightAnswers = scoreKeeper.getRightAnswers();
    int numberOfQuestions = _questions.length;

    Alert(
      context: context,
      title: 'Quiz ended',
      desc: 'You got $rightAnswers out of $numberOfQuestions questions.',
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
        )
      ],
    ).show();
  }

  void checkAnswer(bool answer, BuildContext context) {
    print('********* checkpoint *********');
    print('current question: $_currentQuestion');
    _setCurrentAnswer(answer);
    _setScore();
    _setCurrentQuestion();

    if (_currentQuestion >= _questions.length) {
      _onBasicAlertPressed(context);
      _resetQuiz();
    }
  }
}