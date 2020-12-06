import 'package:flutter/material.dart';
import 'package:phimote/constants/constants.dart';

import 'control_button.dart';

class SelectableControlButton extends StatelessWidget {
  SelectableControlButton({
    Key key,
    this.child,
    this.color = AppColors.orange,
    this.backgroundColor = AppColors.backgroundColor,
    @required this.onPressed,
    this.minWidth,
    this.selected,
    this.selectedChild,
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
