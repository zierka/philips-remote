import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget> actions;
  final IconData leadingIcon;

  const NavigationBar({
    Key key,
    this.title,
    this.actions,
    this.leadingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: this.title,
      actions: this.actions,
      shadowColor: Colors.transparent,
      leading: FlatButton(
          child: Icon(
            leadingIcon != null
                ? leadingIcon
                : ModalRoute.of(context).fullscreenDialog
                    ? Icons.close
                    : Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.maybePop(context);
          }),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

extension ModalRouteExt<T> on ModalRoute<T> {
  bool get fullscreenDialog {
    if (this is MaterialPageRoute) {
      return (this as MaterialPageRoute).fullscreenDialog;
    } else {
      return false;
    }
  }
}
