import 'package:flutter/material.dart';
import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/bmi_brain.dart';
import 'package:bmi_calculator/themes/default_theme.dart';
import 'package:bmi_calculator/components/default_card.dart';
import 'package:bmi_calculator/components/buttons.dart' show BottomButton;

class ResultPage extends StatelessWidget {
  ResultPage({ @required this.bmiBrain });

  final BMIBrain bmiBrain;

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
              child: Text(
                'Your results',
                textAlign: TextAlign.center,
                style: DefaultTheme().defaultValueTextStyle,
              ),
            ),
            Expanded(
              flex: 9,
              child: DefaultCard(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        bmiBrain.resultScale.toUpperCase(),
                        style: TextStyle(
                          letterSpacing: 4,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: bmiBrain.colorScale,
                        )
                      ),
                      Text(
                        bmiBrain.bmi,
                        style: DefaultTheme().defaultValueTextStyle,
                      ),
                      Text(
                        bmiBrain.resultOrientation,
                        textAlign: TextAlign.center,
                        style: DefaultTheme().defaultTextStyle
                      ),
                    ],
                  ),
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
