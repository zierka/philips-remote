import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phimote/logic/models/input_key.dart';
import 'package:phimote/screens/content/control_screen_model.dart';
import 'package:phimote/widgets/control_button.dart';
import 'package:phimote/widgets/gesture_pad.dart';
import 'package:phimote/widgets/volume_control.dart';

class ControlScreen extends StatefulWidget {
  @override
  _ControlScreenState createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  final model = ControlScreenModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ControlButton(
              icon: Icon(Icons.power_settings_new),
              onPressed: () {
                model.postKey(InputKey.Standby);
              },
            ),
            GesturePad(
              onGestureAction: (action) {
                model.handleGesture(action);
              },
            ),
            VolumeControl(
              onVolumeDownPressed: () => model.postKey(InputKey.VolumeDown),
              onVolumeUpPressed: () => model.postKey(InputKey.VolumeUp),
              onChanged: (value) => model.changeVolume(value.toInt()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ControlButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    model.postKey(InputKey.Back);
                  },
                ),
                // SelectableButton(
                //   child: Text("MUTED"),
                //   color: Theme.of(context).accentColor,
                //   onPressed: () {
                //     print("yo2");
                //     KeyInput.postKey(InputKey.Mute);
                //   },
                // ),
                ControlButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    model.postKey(InputKey.Home);
                  },
                ),
                ControlButton(
                  icon: Icon(Icons.tv),
                  onPressed: () {
                    model.postKey(InputKey.WatchTV);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ControlButton(
                  icon: Icon(Icons.play_arrow),
                  onPressed: () {
                    model.postKey(InputKey.Play);
                  },
                ),
                ControlButton(
                  icon: Icon(Icons.pause),
                  onPressed: () {
                    model.postKey(InputKey.Pause);
                  },
                ),
              ],
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
