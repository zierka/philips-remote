import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:phimote/constants/app_colors.dart';
import 'package:phimote/constants/constants.dart';

class ControlButton extends StatelessWidget {
  final Widget child;

  final Color? color;
  final Color? backgroundColor;
  final VoidCallback onPressed;
  final EdgeInsets padding;
  final double minWidth;

  ControlButton({
    required this.child,
    this.color = AppColors.accentColor,
    this.backgroundColor = AppColors.backgroundColor,
    required this.onPressed,
    this.padding = const EdgeInsets.all(Paddings.x1 + Paddings.small),
    this.minWidth = 60,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? Colors.transparent,
      child: FlatButton(
        minWidth: minWidth,
        padding: padding.add(EdgeInsets.all(Paddings.x1)),
        onPressed: _onPressed,
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: Theme(
            data: Theme.of(context).copyWith(
              iconTheme: IconThemeData(color: color ?? AppColors.accentColor),
            ),
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  _onPressed() {
    onPressed();
    Vibrate.feedback(FeedbackType.light);
  }
}
