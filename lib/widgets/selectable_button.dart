import 'package:flutter/material.dart';

class SelectableButton extends StatefulWidget {
  SelectableButton({
    Key key,
    this.child,
    this.color,
    this.onPressed,
  }) : super(key: key);

  final Widget child;
  final Color color;
  @required
  final VoidCallback onPressed;

  @override
  _SelectableButtonState createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: widget.child,
      color: isSelected ? widget.color : Colors.yellow,
      onPressed: () {
        widget.onPressed();
        setState(() {
          isSelected = !isSelected;
        });
      },
    );
  }
}
