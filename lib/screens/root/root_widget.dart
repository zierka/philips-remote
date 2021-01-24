import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:let_log/let_log.dart';
import 'package:phimote/pigeon.dart';
import 'package:shake/shake.dart';
import 'root_model.dart';
import 'package:phimote/screens/content/content_screen.dart';
import 'package:phimote/screens/landing/landing_screen.dart';
import 'package:phimote/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class RootWidget extends StatefulWidget {
  const RootWidget({Key key}) : super(key: key);

  @override
  _RootWidgetState createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  bool isLogScreenVisible = false;

  @override
  void initState() {
    ShakeDetector.autoStart(onPhoneShake: () {
      showLogScreen();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (Platform.isAndroid && !Navigator.of(context).canPop()) {
          AndroidLifecycleHelper().sendToBackground();
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: Consumer<RootModel>(
        builder: (context, model, child) {
          return model.state.when(loading: () {
            return Center(
              child: LoadingIndicator(),
            );
          }, content: (tv) {
            return ContentScreen();
          }, landing: () {
            return LandingScreen();
          });
        },
      ),
    );
  }

  showLogScreen() {
    if (isLogScreenVisible) return;
    isLogScreenVisible = true;

    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => WillPopScope(
          onWillPop: () {
            isLogScreenVisible = false;
            return Future.value(true);
          },
          child: Logger(),
        ),
      ),
    );
  }
}
