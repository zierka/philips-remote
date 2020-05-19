import 'package:flutter/material.dart';
import 'package:philips_remote/main/main_model.dart';
import 'package:philips_remote/screens/device_discovery/pair_screen.dart';
import 'package:philips_remote/screens/device_discovery/scan_screen_old.dart';
import 'package:philips_remote/screens/settings/settings_screen_model.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  final _model = SettingsScreenModel();

  final options = ["Scan", "Pair"];

  _action(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ScanScreenOld();
        }));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return PairScreen();
        }));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    _model.mainModel = Provider.of<MainModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        actions: <Widget>[
          FlatButton(
            textColor: Theme.of(context).errorColor,
            child: Text("Unpair"),
            onPressed: () {
              _model.unpair();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: options.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(options[index]),
            onTap: () => _action(index, context),
            trailing: Icon(Icons.arrow_forward_ios),
          );
        },
      ),
    );
  }
}
