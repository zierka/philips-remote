import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:philips_remote/logic/models/input_key.dart';
import 'package:philips_remote/screens/content/control_screen_model.dart';
import 'package:philips_remote/widgets/control_button.dart';
import 'package:philips_remote/widgets/gesture_pad.dart';
import 'package:philips_remote/widgets/volume_control.dart';

class ControlScreen extends StatefulWidget {
  @override
  _ControlScreenState createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  final model = ControlScreenModel();

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
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

class SelectableButton extends StatefulWidget {
  SelectableButton({
    Key key,
    this.child,
    this.color,
    this.onPressed,
  }) : super(key: key);

  final Widget child;
  final Color color;
  @required
  final VoidCallback onPressed;

  @override
  _SelectableButtonState createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: widget.child,
      color: isSelected ? widget.color : Colors.yellow,
      onPressed: () {
        widget.onPressed();
        setState(() {
          isSelected = !isSelected;
        });
      },
    );
  }
}
