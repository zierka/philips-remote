import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:phimote/constants/constants.dart';

class DialogAction {
  final String title;
  final VoidCallback action;
  final IconData? icon;

  DialogAction({
    required this.title,
    required this.action,
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
        child: Text(title),
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

showAppModalBottomSheet(
  BuildContext context, {
  required VoidCallback onDismiss,
  required List<DialogAction> actions,
}) {
  if (Platform.isIOS) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => _actionSheet(context, onDismiss, actions),
    );
  } else {
    showModalBottomSheet(
      context: context,
      builder: (_) => _bottomSheet(context, onDismiss, actions),
    );
  }
}

Widget _bottomSheet(
  BuildContext context,
  VoidCallback onDismiss,
  List<DialogAction> actions,
) {
  actions.add(
    DialogAction(title: "Cancel", action: onDismiss, icon: Icons.close),
  );

  return Wrap(
    children: actions
        .map(
          (a) => ListTile(
            title: Text(a.title),
            leading: a.icon != null ? Icon(a.icon) : null,
            onTap: () => onDismissed(context, a.action, onDismiss),
          ),
        )
        .toList(),
  );
}

Widget _actionSheet(
    BuildContext context, VoidCallback onDismiss, List<DialogAction> actions) {
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
              onPressed: () => onDismissed(context, a.action, onDismiss),
              child: Text(a.title),
            ),
          )
          .toList(),
      cancelButton: CupertinoActionSheetAction(
        onPressed: () => onDismissed(context, () {}, onDismiss),
        child: Text("Cancel"),
      ),
    ),
  );
}

Future onDismissed(BuildContext context, VoidCallback completion,
    VoidCallback onDismiss) async {
  Navigator.of(context).pop();
  await Future.delayed(Duration(milliseconds: 300));
  onDismiss();
  completion();
}
