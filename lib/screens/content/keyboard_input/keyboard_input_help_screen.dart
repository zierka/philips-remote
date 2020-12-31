import 'package:flutter/material.dart';
import 'package:phimote/constants/ui_constants.dart';
import 'package:phimote/widgets/navigation_bar.dart';

class KeyboardInputHelpScreen extends StatelessWidget {
  const KeyboardInputHelpScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBar(),
      body: Container(
        padding: EdgeInsets.all(Paddings.x2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Alternate input mode",
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: Paddings.x3),
            Text(
              "Some apps (like Netflix, YouTube) implement their own on-screen keyboard instead of showing the system one, so regular keyboard input does not work. Alternate input mode provides some text entry support for these apps.",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(height: Paddings.x2),
            Text(
              "Certain editing features (like deleting text) is not supported in this mode.",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}
