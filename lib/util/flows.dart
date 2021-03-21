import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mailer/flutter_mailer.dart';

import 'extensions/dialog.dart';

String _feedbackEmail = "phimoteapp@gmail.com";

startSendFeedbackFlow(BuildContext context) async {
  // final path = await Log.logFilePath();

  // send feedback
  final options = MailOptions(
    subject: "[Phimote] Feedback",
    recipients: [_feedbackEmail],
    // attachments: [path],
  );
  if (Platform.isAndroid ||
      Platform.isIOS && await FlutterMailer.canSendMail()) {
    await FlutterMailer.send(options);
  } else {
    showCustomDialog(
      "Unable to show email composer",
      SelectableText("Send your feedback to $_feedbackEmail.\nThank you!"),
      context,
    );
  }
}
