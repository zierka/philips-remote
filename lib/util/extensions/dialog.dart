import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:phimote/constants/constants.dart';

class DialogAction {
  final String title;
  final VoidCallback action;
  final IconData icon;

  DialogAction({
    @required this.title,
    @required this.action,
    this.icon,
  });
}

showTextDialog(String title, String message, BuildContext context) {
  showCustomDialog(title, Text(message), context);
}

showCustomDialog(String title, Widget content, BuildContext context) {
  showPlatformDialog(
    context: context,
    builder: (context) => PlatformAlertDialog(
      title: Padding(
        padding: EdgeInsets.only(bottom: Paddings.x1),
        child: Text(title ?? ""),
      ),
      content: content,
      actions: [
        PlatformDialogAction(
          child: Text("OK"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
  );
}

showAppModalBottomSheet(BuildContext context, List<DialogAction> actions) {
  if (Platform.isIOS) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => _actionSheet(context, actions),
    );
  } else {
    showModalBottomSheet(
      context: context,
      builder: (_) => _bottomSheet(context, actions),
    );
  }
}

Widget _bottomSheet(BuildContext context, List<DialogAction> actions) {
  actions.add(
    DialogAction(title: "Cancel", action: () {}, icon: Icons.close),
  );

  return Wrap(
    children: actions
        .map(
          (a) => ListTile(
            title: Text(a.title),
            leading: a.icon != null ? Icon(a.icon) : null,
            onTap: () => onDismissed(context, a.action),
          ),
        )
        .toList(),
  );
}

Widget _actionSheet(BuildContext context, List<DialogAction> actions) {
  return Theme(
    data: Theme.of(context).copyWith(
      cupertinoOverrideTheme: CupertinoTheme.of(context).copyWith(
        primaryColor: AppColors.accentColor,
      ),
    ),
    child: CupertinoActionSheet(
      actions: actions
          .map(
            (a) => CupertinoActionSheetAction(
              onPressed: () => onDismissed(context, a.action),
              child: Text(a.title),
            ),
          )
          .toList(),
      cancelButton: CupertinoActionSheetAction(
        onPressed: () => onDismissed(context, () {}),
        child: Text("Cancel"),
      ),
    ),
  );
}

Future onDismissed(BuildContext context, VoidCallback completion) async {
  Navigator.of(context).pop();
  await Future.delayed(Duration(milliseconds: 300));
  completion();
}
