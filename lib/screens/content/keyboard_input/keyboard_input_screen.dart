import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:phimote/constants/constants.dart';
import 'package:phimote/logic/services/logging/analytics.dart';
import 'package:phimote/screens/content/keyboard_input/keyboard_input_help_screen.dart';
import 'package:phimote/widgets/button.dart';
import 'package:phimote/widgets/control_button.dart';
import 'package:phimote/widgets/navigation_bar.dart';

import 'keyboard_input_screen_model.dart';

class KeyboardInputScreen extends StatefulWidget {
  final VoidCallback onFinished;

  const KeyboardInputScreen({
    Key? key,
    required this.onFinished,
  }) : super(key: key);

  @override
  _KeyboardInputScreenState createState() => _KeyboardInputScreenState();
}

class _KeyboardInputScreenState extends State<KeyboardInputScreen> {
  KeyboardInputScreenModel model = KeyboardInputScreenModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBar(
        leadingIcon: Icons.close,
        title: Row(
          children: [
            Text("alternate input"),
            SizedBox(width: Paddings.x1),
            PlatformSwitch(
              value: model.alternateInputMode,
              onChanged: (value) {
                setState(() {
                  model.alternateInputMode = value;

                  Analytics.track(
                    "keyboard alternate input toggle",
                    properties: {"state": value ? "on" : "off"},
                  );
                });
              },
            ),
          ],
        ),
        actions: [
          Button(
            child: Icon(Icons.help),
            onPressed: showHelpScreen,
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(Paddings.x2),
        child: TextField(
          inputFormatters: model.alternateInputMode
              ? [BackspaceProhibitingInputFormatter()]
              : [],
          cursorColor: AppColors.accentColor,
          autofocus: true,
          autocorrect: false,
          onSubmitted: (string) {
            model.submitText(string);
            widget.onFinished();
          },
          onChanged: (string) {
            model.textChanged(string);
          },
        ),
      ),
    );
  }

  showHelpScreen() async {
    Analytics.track("keyboard help tap");

    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => KeyboardInputHelpScreen(),
      ),
    );
  }
}

class BackspaceProhibitingInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length < oldValue.text.length) {
      final value = TextEditingValue(
        text: oldValue.text,
        selection: TextSelection(
          baseOffset: oldValue.text.length,
          extentOffset: oldValue.text.length,
        ),
      );
      return value;
    }

    return newValue;
  }
}
