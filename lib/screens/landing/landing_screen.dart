import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:philips_remote/main_model.dart';
import 'package:philips_remote/screens/device_discovery/pair_screen.dart';
import 'package:philips_remote/screens/device_discovery/pair_screen_old.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Landing"),
      ),
      body: Center(
        child: FlatButton(
          child: Text("scan for tv"),
          color: Colors.yellow,
          onPressed: () {
            final mainModel = Provider.of<MainModel>(context, listen: false);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return ChangeNotifierProvider<MainModel>.value(
                value: mainModel,
                child: PairScreen(),
              );
            }));
          },
          onLongPress: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return PairScreenOld();
            }));
          },
        ),
      ),
    );
  }
}
