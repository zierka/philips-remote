import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:phimote/logic/services/logging/analytics.dart';
import 'package:phimote/screens/settings/general_settings_screen_model.dart';
import 'package:phimote/widgets/list_item.dart';
import 'package:phimote/widgets/fixed_app_bar.dart';

class GeneralSettingsScreen extends StatefulWidget {
  const GeneralSettingsScreen({Key? key}) : super(key: key);

  @override
  _GeneralSettingsScreenState createState() => _GeneralSettingsScreenState();
}

class _GeneralSettingsScreenState extends State<GeneralSettingsScreen> {
  GeneralSettingsScreenModel _model = GeneralSettingsScreenModel();

  @override
  void initState() {
    _model.load().then((_) {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FixedAppBar(
        title: Text("General"),
      ),
      body: ListView(
        children: [
          ListItem(
            data: ListItemData("Keep screen on", ""),
            trailing: PlatformSwitch(
              value: _model.keepScreenOn,
              onChanged: (value) {
                Analytics.track(
                  "keep screen on toggle",
                  properties: {"state": value ? "on" : "off"},
                );
                setState(() {
                  _model.saveKeepScreenOn(value);
                });
              },
            ),
          ),
          ListItem(
            data: ListItemData("Shake to send feedback / view logs", ""),
            trailing: PlatformSwitch(
              value: _model.shakeToFeedback,
              onChanged: (value) {
                Analytics.track(
                  "shake to feedback toggle",
                  properties: {"state": value ? "on" : "off"},
                );
                setState(() {
                  _model.saveShakeToFeedback(value);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
