import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:phimote/constants/app_colors.dart';
import 'package:phimote/constants/constants.dart';
import 'package:phimote/widgets/button.dart';

class ControlButton extends StatelessWidget {
  final Widget child;

  final Color? color;
  final Color? backgroundColor;
  final VoidCallback onPressed;
  final double minWidth;

  ControlButton({
    required this.child,
    this.color = AppColors.accentColor,
    this.backgroundColor = AppColors.backgroundColor,
    required this.onPressed,
    this.minWidth = 60,
  });

  @override
  Widget build(BuildContext context) {
    return Button(
      color: color,
      backgroundColor: backgroundColor,
      onPressed: _onPressed,
      child: child,
    );
  }

  _onPressed() {
    onPressed();

    Vibrate.feedback(FeedbackType.light);
  }
}
