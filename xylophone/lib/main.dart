import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const _APP_TITLE = 'Xylophone';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _APP_TITLE,
      home: Scaffold(
        appBar: AppBar(
          title: Text(_APP_TITLE),
          backgroundColor: Colors.blueGrey.shade900,
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: XylophoneKeyboard(),
        ),
      ),
    );
  }
}

class XylophoneKeyboard extends StatelessWidget {
  final List colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple,
  ];

  List<Widget> buildKeyboard() {
    var keyboard = List<Widget>();

    this.colors.forEach((c) {
      keyboard.add(
        NoteButton (
          noteNumber: this.colors.indexOf(c) + 1,
          buttonColor: c
        )
      );
    });

    return keyboard;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: this.buildKeyboard(),
    );
  }
}

class NoteButton extends StatelessWidget {
  final player = AudioCache();
  final String noteFile;
  final Color buttonColor;

  // Class initializer
  // className(params) : initializer expression 1, initializer expression 2, ...
  NoteButton({
    int noteNumber,
    Color buttonColor
  }) :
    this.noteFile = 'note$noteNumber.wav',
    this.buttonColor = buttonColor;


  void playNote() {
    player.play(this.noteFile);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        color: this.buttonColor,
        onPressed: () => this.playNote(),
      ),
    );
  }
}