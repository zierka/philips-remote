import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phimote/constants/constants.dart';

import 'widget_load_state.dart';

class ErrorStateWidget extends StatelessWidget {
  final ScreenError error;
  final VoidCallback onPressed;

  const ErrorStateWidget({
    Key? key,
    required this.error,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Paddings.x6),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(error.message),
            SizedBox(
              height: Paddings.x3,
            ),
            // ActionButton(
            //   title: "Retry",
            //   onPressed: onPressed,
            // ),
          ],
        ),
      ),
    );
  }
}
