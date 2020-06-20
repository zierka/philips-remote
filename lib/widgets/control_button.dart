import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ControlButton extends StatelessWidget {
  final Widget icon;
  final Color color;
  final VoidCallback onPressed;

  ControlButton({this.icon, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: IconButton(
        icon: icon,
        color: color,
        onPressed: onPressed,
      ),
    );
  }
}
