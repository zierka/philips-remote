import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:phimote/constants/constants.dart';

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
