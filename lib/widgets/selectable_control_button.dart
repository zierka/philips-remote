import 'package:flutter/material.dart';
import 'package:phimote/constants/constants.dart';

import 'control_button.dart';

class SelectableControlButton extends StatelessWidget {
  SelectableControlButton({
    Key? key,
    required this.child,
    this.color = AppColors.accentColor,
    this.backgroundColor = AppColors.backgroundColor,
    required this.onPressed,
    required this.minWidth,
    required this.selected,
    required this.selectedChild,
  }) : super(key: key);

  final Widget child;
  final Color color;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final double minWidth;

  final bool selected;
  final Widget selectedChild;

  @override
  Widget build(BuildContext context) {
    return ControlButton(
      child: selected ? selectedChild : child,
      color: selected ? backgroundColor : color,
      backgroundColor: selected ? color : backgroundColor,
      onPressed: onPressed,
      minWidth: minWidth,
    );
  }
}
