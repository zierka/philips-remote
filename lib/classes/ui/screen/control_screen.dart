import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:philips_remote/classes/api/commands.dart';
import 'package:philips_remote/classes/api/get.dart';
import 'package:philips_remote/classes/api/key_input.dart';
import 'package:philips_remote/classes/ui/components/gesture_pad.dart';
import 'package:philips_remote/classes/ui/components/volume_control.dart';

class RemoteUI extends StatefulWidget {
  @override
  _RemoteUIState createState() => _RemoteUIState();
}

class _RemoteUIState extends State<RemoteUI> {
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
                KeyInput.postKey(InputKey.Standby);
                // Commands.powerOn();
              },
            ),
            GesturePad(),
            VolumeControl(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    KeyInput.postKey(InputKey.Back);
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
                    KeyInput.postKey(InputKey.Home);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.tv),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    KeyInput.postKey(InputKey.WatchTV);
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
                    KeyInput.postKey(InputKey.Play);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.pause),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    KeyInput.postKey(InputKey.Pause);
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
