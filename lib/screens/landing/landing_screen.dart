import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:philips_remote/screens/device_discovery/pair_screen.dart';
import 'package:philips_remote/widgets/title_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Center(
          child: TitleButton(
            title: "scan for tv",
            onPressed: () {
              onScanTapped(context);
            },
          ),
        ),
      ),
    );
  }
}

onScanTapped(BuildContext context) {
  Navigator.of(context).push(
    platformPageRoute(
      context: context,
      builder: (context) {
        return PairScreen();
      },
    ),
  );
}
