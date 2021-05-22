import 'package:flutter/cupertino.dart';

class Message {
  IconData? icon;
  String? message;
  Duration? hidesAfter;
  // final String actionName;
  // final Function action;

  bool showLoading;

  Message? previousMessage;

  Message({
    required this.icon,
    required this.message,
    this.hidesAfter,
    this.showLoading = false,
  });
}
