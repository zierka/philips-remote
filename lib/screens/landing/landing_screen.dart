import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:phimote/logic/services/logging/analytics.dart';
import 'package:phimote/screens/device_discovery/pair_screen.dart';
import 'package:phimote/widgets/title_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

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

onPairFinished(BuildContext context) {
  Navigator.of(context).popUntil((route) => route.isFirst);
}

onScanTapped(BuildContext context) {
  Analytics.track("scan tap");

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_context) {
        return PairScreen(
          onPairFinished: () => onPairFinished(_context),
        );
      },
    ),
  );
}
