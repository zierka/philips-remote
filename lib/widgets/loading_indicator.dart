import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class LoadingIndicator extends StatelessWidget {
  final Brightness brightness;

  LoadingIndicator({
    Key key,
    this.brightness = Brightness.dark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return Theme(
        data: Theme.of(context).copyWith(brightness: brightness),
        child: PlatformCircularProgressIndicator(),
      );
    } else {
      return PlatformCircularProgressIndicator();
    }
  }
}
