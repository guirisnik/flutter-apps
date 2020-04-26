import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/default_card.dart';

class ToggleButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final Color selectedColor;
  final Color deselectedColor;
  final Function onTapCallback;

  ToggleButton({
    this.icon = Icons.ac_unit,
    this.label = '',
    @required this.selectedColor,
    @required this.deselectedColor,
    @required this.onTapCallback,
  });

  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool isSelected = false;

  void onTap() {
    setState(() {
      widget.onTapCallback();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultCard.iconAndLabelButton(
      icon: widget.icon,
      label: widget.label,
      color: this.isSelected ? widget.selectedColor : widget.deselectedColor,
      onTap: () => this.onTap(),
    );
  }
}