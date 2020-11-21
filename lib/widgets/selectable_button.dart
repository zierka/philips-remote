import 'package:flutter/material.dart';
import 'package:phimote/constants/constants.dart';

class SelectableButton extends StatelessWidget {
  SelectableButton({
    Key key,
    @required this.selected,
    @required this.title,
    this.enabledTitle,
    @required this.onPressed,
  }) : super(key: key);

  final bool selected;
  final String title;
  final String enabledTitle;
  final Function(bool) onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        selected ? enabledTitle ?? title : title,
        style: TextStyle(
            color: !selected ? AppColors.orange : AppColors.backgroundColor),
      ),
      color: selected ? AppColors.orange : AppColors.backgroundColor,
      onPressed: () => onPressed(!selected),
    );
  }
}
