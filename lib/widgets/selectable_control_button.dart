import 'package:flutter/material.dart';
import 'package:phimote/constants/constants.dart';

import 'control_button.dart';

class SelectableControlButton extends StatelessWidget {
  SelectableControlButton({
    Key key,
    this.icon,
    this.title,
    this.color = AppColors.orange,
    this.backgroundColor = AppColors.backgroundColor,
    @required this.onPressed,
    this.minWidth,
    this.selected,
    this.selectedIcon,
    this.selectedTitle,
  }) : super(key: key);

  final Widget icon;
  final String title;
  final Color color;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final double minWidth;

  final bool selected;
  final Widget selectedIcon;
  final String selectedTitle;

  @override
  Widget build(BuildContext context) {
    return ControlButton(
      icon: selected ? selectedIcon : icon,
      title: selected ? selectedTitle : title,
      color: selected ? backgroundColor : color,
      backgroundColor: selected ? color : backgroundColor,
      onPressed: onPressed,
      minWidth: minWidth,
    );
  }
}

// class SelectableButtonOld extends StatelessWidget {
//   SelectableButtonOld({
//     Key key,
//     @required this.selected,
//     @required this.title,
//     this.enabledTitle,
//     @required this.onPressed,
//   }) : super(key: key);

//   final bool selected;
//   final String title;
//   final String enabledTitle;
//   final Function(bool) onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return FlatButton(
//       child: Text(
//         selected ? enabledTitle ?? title : title,
//         style: TextStyle(
//             color: !selected ? AppColors.orange : AppColors.backgroundColor),
//       ),
//       color: selected ? AppColors.orange : AppColors.backgroundColor,
//       onPressed: () => onPressed(!selected),
//     );
//   }
// }
