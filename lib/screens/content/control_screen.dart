import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:philips_remote/data/models/input_key.dart';
import 'package:philips_remote/screens/content/control_screen_model.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.power_settings_new),
              color: Theme.of(context).accentColor,
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
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Theme.of(context).accentColor,
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
                IconButton(
                  icon: Icon(Icons.home),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    model.postKey(InputKey.Home);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.tv),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    model.postKey(InputKey.WatchTV);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.play_arrow),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    model.postKey(InputKey.Play);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.pause),
                  color: Theme.of(context).accentColor,
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
