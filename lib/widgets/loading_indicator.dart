import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum LoadingIndicatorSize { small, large }

class LoadingIndicator extends StatelessWidget {
  final Brightness brightness;
  final LoadingIndicatorSize size;

  LoadingIndicator({
    Key? key,
    this.brightness = Brightness.dark,
    this.size = LoadingIndicatorSize.large,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return Theme(
        data: Theme.of(context).copyWith(brightness: brightness),
        child: CupertinoActivityIndicator(radius: size.dimensions / 2),
      );
    } else {
      return SizedBox(
        width: size.dimensions,
        height: size.dimensions,
        child: CircularProgressIndicator(
          strokeWidth: size.strokeWidth,
          valueColor:
              AlwaysStoppedAnimation<Color>(Theme.of(context).accentColor),
        ),
      );
    }
  }
}

extension on LoadingIndicatorSize {
  double get dimensions {
    switch (this) {
      case LoadingIndicatorSize.small:
        return 20;
      case LoadingIndicatorSize.large:
        return 30;
    }
  }

  double get strokeWidth {
    switch (this) {
      case LoadingIndicatorSize.small:
        return 3;
      case LoadingIndicatorSize.large:
        return 4;
    }
  }
}
