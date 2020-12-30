import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:phimote/screens/settings/general_settings_screen_model.dart';
import 'package:phimote/widgets/list_item.dart';
import 'package:phimote/widgets/navigation_bar.dart';

class GeneralSettingsScreen extends StatefulWidget {
  const GeneralSettingsScreen({Key key}) : super(key: key);

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
      appBar: NavigationBar(
        title: Text("General"),
      ),
      body: ListView(
        children: [
          ListItem(
            data: ListItemData("Keep screen on", ""),
            trailing: PlatformSwitch(
              value: _model.keepScreenOn,
              onChanged: (value) {
                setState(() {
                  _model.saveKeepScreenOn(value);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
