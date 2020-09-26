import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phimote/constants/app_colors.dart';

class ControlButton extends StatelessWidget {
  final Widget icon;
  final Color color;
  final VoidCallback onPressed;

  ControlButton({
    this.icon,
    this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: IconButton(
        icon: icon,
        color: color ?? AppColors.accentColor,
        onPressed: onPressed,
      ),
    );
  }
}
