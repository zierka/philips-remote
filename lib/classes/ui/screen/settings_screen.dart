import 'package:flutter/material.dart';
import 'package:philips_remote/classes/ui/screen/pair_screen.dart';
import 'package:philips_remote/classes/ui/screen/scan_screen.dart';

class SettingsScreen extends StatelessWidget {
  final options = ["Scan", "Pair"];

  _action(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ScanScreen();
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite channels"),
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
