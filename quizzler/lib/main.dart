import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'score.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const APP_TITLE = 'Quizzler';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_TITLE,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            APP_TITLE,
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),
          ),
          backgroundColor: Colors.amber.shade600,
        ),
        backgroundColor: Colors.blueGrey.shade900,
        body: SafeArea(
          child: Quiz(),
        ),
      ),
    );
  }
}

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  static Score score = Score();
  QuizBrain quizBrain = QuizBrain(score: score);

  void checkAnswer(bool answer) {
    setState(() {
      quizBrain.checkAnswer(answer, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                quizBrain.getCurrentQuestion().getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: FlatButton(
              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),
              ),
              color: Colors.green,
              onPressed: () => this.checkAnswer(true),
            ),
          )
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: FlatButton(
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),
              ),
              color: Colors.red,
              onPressed: () => this.checkAnswer(false),
            ),
          )
        ),
        Row(
          children: score.getScore(),
        )
      ],
    );
  }
}
