import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:let_log/let_log.dart';
import 'package:phimote/data_access/persistence/preference_store.dart';
import 'package:phimote/logic/services/logging/analytics.dart';
import 'package:phimote/pigeon.dart';
import 'package:phimote/util/extensions/dialog.dart';
import 'package:phimote/util/flows.dart';
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
  bool shakeDialogOpen = false;

  @override
  void initState() {
    ShakeDetector.autoStart(
      shakeThresholdGravity: 5,
      shakeSlopTimeMS: 1000,
      onPhoneShake: () {
        shakeHappened();
      },
    );

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

  Future shakeHappened() async {
    final store = PreferenceStore();

    final enabled = await store.shakeToFeedback;

    if (!enabled) return;

    shakeDialogOpen = true;

    showAppModalBottomSheet(
      context,
      onDismiss: () => shakeDialogOpen = false,
      actions: [
        DialogAction(
          title: "Send feedback",
          icon: Icons.mail_outline,
          action: () {
            shakeDialogOpen = false;
            startSendFeedbackFlow(context);
          },
        ),
        DialogAction(
          title: "Show logs",
          icon: Icons.list,
          action: () => showLogScreen(),
        ),
        DialogAction(
          title: "Don't show me this again",
          icon: Icons.remove_circle_outline,
          action: () {
            Analytics.track("disable shake to feedback tap");
            store.setShakeToFeedback(false);
          },
        ),
      ],
    );
  }

  showFeedback(BuildContext context) {
    Analytics.track("feedback tap", properties: {"source": "shake menu"});

    startSendFeedbackFlow(context);
  }

  showLogScreen() {
    Analytics.track("view logs tap");

    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => Logger(),
      ),
    );
  }
}
