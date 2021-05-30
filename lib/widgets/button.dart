import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phimote/constants/app_colors.dart';
import 'package:phimote/constants/constants.dart';

class Button extends StatelessWidget {
  final Widget child;

  final Color? color;
  final Color? backgroundColor;
  final VoidCallback onPressed;
  final EdgeInsets? padding;

  Button({
    required this.child,
    this.color = AppColors.white,
    this.backgroundColor,
    required this.onPressed,
    this.padding = const EdgeInsets.all(Paddings.x2),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: onPressed,
      child: Ink(
        color: backgroundColor ?? Colors.transparent,
        padding: padding,
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: Theme(
            data: Theme.of(context).copyWith(
              iconTheme:
                  IconThemeData(color: color ?? Theme.of(context).accentColor),
            ),
            child: DefaultTextStyle.merge(
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
              child: Center(
                widthFactor: 1,
                heightFactor: 1,
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
