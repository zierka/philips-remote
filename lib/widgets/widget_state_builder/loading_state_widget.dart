import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class LoadingStateWidget extends StatelessWidget {
  final Color backgroundColor;

  const LoadingStateWidget({
    Key key,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: PlatformCircularProgressIndicator(),
      ),
    );
  }
}
