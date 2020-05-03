import 'package:flutter/material.dart';
import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/bmi_brain.dart';
import 'package:bmi_calculator/routes/result_page.dart';
import 'package:bmi_calculator/themes/default_theme.dart';
import 'package:bmi_calculator/components/default_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/buttons.dart' show BottomButton;

const int MAX_AGE = 130;
const int MIN_AGE = 0;
const double MAX_HEIGHT = 250;
const double MIN_HEIGHT = 40;

enum Gender { male, female }
enum Property { weight, age }

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Gender selectedGender;
  double cmHeight = 150;
  double kgWeight = 60;
  double yearsAge = 21;

  void onPressWeight(ButtonOption option) {
    setState(() {
      option == ButtonOption.increase ? this.kgWeight++ : this.kgWeight--;
    });
  }

  void onPressAge(ButtonOption option) {
    setState(() {
      if (this.yearsAge <= MAX_AGE && this.yearsAge > MIN_AGE)
        option == ButtonOption.increase ? this.yearsAge++ : this.yearsAge--;
    });
  }

  void onChangeSlider(double newValue) {
    setState(() {
      this.cmHeight = newValue.roundToDouble();
    });
  }

  void selectGender(Gender gender) {
    setState(() {
      this.selectedGender = gender;
    });
  }

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
              flex: 3,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: DefaultCard.iconAndLabelButton(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                        color: selectedGender == Gender.male
                            ? DefaultTheme.buttonSelectedColor
                            : DefaultTheme.buttonDeselectedColor,
                        onTap: () => this.selectGender(Gender.male),
                      ),
                    ),
                    Expanded(
                      child: DefaultCard.iconAndLabelButton(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                        color: selectedGender == Gender.female
                            ? DefaultTheme.buttonSelectedColor
                            : DefaultTheme.buttonDeselectedColor,
                        onTap: () => this.selectGender(Gender.female),
                      ),
                    ),
                  ]),
            ),
            Expanded(
              flex: 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: DefaultCard.slider(
                      label: 'HEIGHT',
                      unit: 'cm',
                      maxSliderValue: MAX_HEIGHT,
                      minSliderValue: MIN_HEIGHT,
                      value: this.cmHeight,
                      onChange: onChangeSlider,
                      sliderTheme: DefaultTheme(context: context).defaultSliderTheme,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: DefaultCard.valueUpAndDownButton(
                        label: 'WEIGHT',
                        unit: 'kg',
                        value: kgWeight,
                        onPress: onPressWeight,
                      ),
                    ),
                    Expanded(
                      child: DefaultCard.valueUpAndDownButton(
                        label: 'Age',
                        unit: 'years',
                        value: yearsAge,
                        onPress: onPressAge,
                      ),
                    ),
                  ]),
            ),
            Expanded(
              child: BottomButton(
                label: 'CALCULATE',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResultPage(
                      bmiBrain: BMIBrain(
                        height: this.cmHeight,
                        weight: this.kgWeight
                      ),
                    ))
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
