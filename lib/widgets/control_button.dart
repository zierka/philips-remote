import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phimote/constants/app_colors.dart';
import 'package:phimote/constants/constants.dart';

class ControlButton extends StatelessWidget {
  final Widget icon;
  final String title;
  final Color color;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final EdgeInsets padding;
  final double minWidth;

  ControlButton({
    this.icon,
    this.title,
    this.color = AppColors.orange,
    this.backgroundColor = AppColors.backgroundColor,
    @required this.onPressed,
    this.padding = const EdgeInsets.all(Paddings.x1 + Paddings.small),
    this.minWidth = 60,
  }) : assert(icon != null || title != null);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? Colors.transparent,
      child: icon != null
          ? IconButton(
              padding: padding.add(EdgeInsets.all(Paddings.small)),
              icon: icon,
              iconSize: 30,
              color: color ?? AppColors.accentColor,
              onPressed: onPressed,
            )
          : FlatButton(
              minWidth: minWidth,
              padding: padding.add(EdgeInsets.all(Paddings.x1)),
              onPressed: onPressed,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ),
    );
  }
}
