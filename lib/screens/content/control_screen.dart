import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:phimote/constants/app_colors.dart';
import 'package:phimote/constants/ui_constants.dart';
import 'package:phimote/logic/models/input_key.dart';
import 'package:phimote/logic/services/system_repository.dart';
import 'package:phimote/screens/content/control_provider.dart';
import 'package:phimote/screens/settings/settings_screen.dart';
import 'package:phimote/widgets/control_button.dart';
import 'package:phimote/widgets/gesture_pad.dart';
import 'package:phimote/widgets/volume_control.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'keyboard_input_screen.dart';

class ControlScreen extends StatefulWidget {
  @override
  _ControlScreenState createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  ControlProvider controlProvider;

  final controller = PageController(viewportFraction: 1.0);

  @override
  void initState() {
    controlProvider = ControlProvider();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        actions: [
          ControlButton(
            child: Icon(Icons.settings),
            onPressed: onSettingsTapped,
          ),
        ],
      ),
      body: SafeArea(
        child: ChangeNotifierProvider.value(
          value: controlProvider,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ControlButton(
                child: Icon(Icons.power_settings_new),
                onPressed: () => controlProvider.postKey(InputKey.Standby),
              ),
              GesturePad(
                onGestureAction: (action) =>
                    controlProvider.handleGesture(action),
              ),
              persistentControls(controlProvider),
              Divider(
                thickness: 2,
                indent: Paddings.x2,
                endIndent: Paddings.x2,
                color: AppColors.greyDark,
              ),
              SizedBox(
                height: 150,
                child: PageView(
                  controller: controller,
                  children: [
                    page1(controlProvider),
                    page2(controlProvider),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Container(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 2,
                  effect: SlideEffect(
                    dotWidth: 8.0,
                    dotHeight: 8.0,
                    dotColor: AppColors.greyDark,
                    activeDotColor: AppColors.accentColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget persistentControls(ControlProvider controlProvider) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        VolumeControl(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ControlButton(
              child: Icon(Icons.arrow_back),
              onPressed: () => controlProvider.postKey(InputKey.Back),
            ),
            ControlButton(
              child: Icon(Icons.home),
              onPressed: () {
                controlProvider.postKey(InputKey.Home);
              },
            ),
            ControlButton(
              child: Text("TV"),
              onPressed: () => controlProvider.postKey(InputKey.WatchTV),
            ),
          ],
        ),
      ],
    );
  }

  Widget page1(ControlProvider controlProvider) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ControlButton(
              child: Icon(Icons.play_arrow),
              onPressed: () => controlProvider.postKey(InputKey.Play),
            ),
            ControlButton(
              child: Icon(Icons.pause),
              onPressed: () => controlProvider.postKey(InputKey.Pause),
            ),
            ControlButton(
              child: Text("SOURCE"),
              onPressed: () => controlProvider.postKey(InputKey.Source),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ControlButton(
              child: Icon(Icons.fast_rewind),
              onPressed: () => controlProvider.postKey(InputKey.Rewind),
            ),
            ControlButton(
              child: Icon(Icons.fast_forward),
              onPressed: () => controlProvider.postKey(InputKey.FastForward),
            ),
            ControlButton(
              child: Text("SUBTITLES"),
              onPressed: () => controlProvider.postKey(InputKey.Subtitle),
            ),
          ],
        ),
      ],
    );
  }

  Widget page2(ControlProvider controlProvider) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ControlButton(
              child: Row(
                children: [
                  Icon(Icons.play_arrow),
                  Text("/"),
                  Icon(Icons.pause),
                ],
              ),
              onPressed: () => controlProvider.postKey(InputKey.PlayPause),
            ),
            ControlButton(
              child: Icon(Icons.info),
              onPressed: () => controlProvider.postKey(InputKey.Info),
            ),
            ControlButton(
              child: Icon(Icons.video_settings),
              onPressed: () => controlProvider.postKey(InputKey.Options),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ControlButton(
              child: Icon(Icons.search),
              onPressed: () => controlProvider.postKey(InputKey.Find),
            ),
            ControlButton(
              child: Icon(Icons.keyboard),
              onPressed: keyboardButtonTapped,
            ),
            ControlButton(
              child: Icon(Icons.fit_screen),
              onPressed: () => controlProvider.postKey(InputKey.Viewmode),
            ),
          ],
        ),
      ],
    );
  }

  onSettingsTapped() {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => SettingsScreen(),
      ),
    );
  }

  keyboardButtonTapped() {
    showModalBottomSheet(
      context: context,
      builder: (context) => KeyboardInputScreen(
        onFinished: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
