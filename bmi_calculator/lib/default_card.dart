import 'package:flutter/material.dart';
import 'package:bmi_calculator/buttons.dart';
import 'package:bmi_calculator/default_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum ButtonOption { increase, decrease }

class DefaultCard extends StatelessWidget {
  final Widget child;
  final Color color;
  final Function onTap;

  DefaultCard({ this.child, this.color, this.onTap });

  DefaultCard.iconAndLabelButton({
    IconData icon,
    String label,
    Color color,
    Function onTap
  }):
    this.child = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        const SizedBox(height: 20,),
        Text(
          label,
          style: DefaultTheme().defaultTextStyle,
        ),
      ],
    ),
    this.color = color,
    this.onTap = onTap;

  DefaultCard.valueUpAndDownButton({
    String label = '',
    String unit = '',
    @required double value,
    @required Function(ButtonOption) onPress,
  }):
    this.onTap = null,
    this.color = DefaultTheme.defaultCardColor,
    this.child = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          label,
          style: DefaultTheme().defaultTextStyle,
        ),
        Row(
          textBaseline: TextBaseline.alphabetic,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: <Widget>[
            Text(
              '${value.round()}',
              style: DefaultTheme().defaultValueTextStyle,
            ),
            Text(
              unit,
              style: DefaultTheme().defaultTextStyle,
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RoundIconButton(
              fillColor: DefaultTheme.defaultRoundButtonColor,
              icon: FontAwesomeIcons.minus,
              onPressed: () => onPress(ButtonOption.decrease),
            ),
            RoundIconButton(
              fillColor: DefaultTheme.defaultRoundButtonColor,
              icon: FontAwesomeIcons.plus,
              onPressed: () => onPress(ButtonOption.increase),
            ),
          ],
        )
      ],
    );

  DefaultCard.slider({
    String label = '',
    String unit = '',
    double maxSliderValue = 1000,
    double minSliderValue = -1000,
    @required double value,
    @required Function(double) onChange,
    @required SliderThemeData sliderTheme,
  }):
    this.color = DefaultTheme.defaultCardColor,
    this.onTap = null,
    this.child = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          label,
          style: DefaultTheme().defaultTextStyle,
        ),
        Row(
          textBaseline: TextBaseline.alphabetic,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: <Widget>[
            Text(
              '${value.round()}',
              style: DefaultTheme().defaultValueTextStyle,
            ),
            Text(
              unit,
              style: DefaultTheme().defaultTextStyle,
            )
          ],
        ),
        SliderTheme(
          data: sliderTheme,
          child: Slider(
            min: minSliderValue,
            max: maxSliderValue,
            value: value,
            onChanged: onChange,
          ),
        ),
      ],
    );


  @override
  Widget build(BuildContext build) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.all(15),
        color: color,
        child: child,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}