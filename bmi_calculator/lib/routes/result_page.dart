import 'dart:math';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/components/buttons.dart' show BottomButton;
import 'package:bmi_calculator/components/default_card.dart';
import 'package:bmi_calculator/themes/default_theme.dart';

class ResultPage extends StatelessWidget {
  final double height;
  final double weight;

  ResultPage({
    @required this.height,
    @required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.appTitle),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 9,
              child: DefaultCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'RESULT SCALE',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      )
                    ),
                    Text(
                      '${(this.weight / pow(this.height / 100, 2)).toStringAsFixed(1)}',
                      style: DefaultTheme().defaultValueTextStyle,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: BottomButton(
                label: 'RE-CALCULATE',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
