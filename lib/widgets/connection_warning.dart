import 'package:flutter/material.dart';
import 'package:phimote/constants/ui_constants.dart';

class ConnectionWarning extends StatelessWidget {
  const ConnectionWarning({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Paddings.x2,
          vertical: Paddings.x2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: Colors.grey[900],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.wifi_off),
            SizedBox(width: Paddings.x1),
            Flexible(
              child: Text(
                "You're not connected to your local network",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
