import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:philips_remote/main/main_model.dart';
import 'package:philips_remote/screens/device_discovery/pair_screen.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Center(
        child: PlatformButton(
          child: Text("scan for tv"),
          onPressed: () {
            final mainModel = Provider.of<MainModel>(context, listen: false);
            Navigator.of(context).push(platformPageRoute(
                context: context,
                builder: (context) {
                  return ChangeNotifierProvider<MainModel>.value(
                    value: mainModel,
                    child: PairScreen(),
                  );
                }));
          },
        ),
      ),
    );
  }
}
