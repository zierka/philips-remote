import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phimote/logic/models/input_key.dart';
import 'package:phimote/screens/content/control_provider.dart';
import 'package:phimote/widgets/control_button.dart';
import 'package:phimote/widgets/gesture_pad.dart';
import 'package:phimote/widgets/volume_control.dart';
import 'package:provider/provider.dart';

class ControlScreen extends StatefulWidget {
  @override
  _ControlScreenState createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  ControlProvider controlProvider;

  @override
  void initState() {
    controlProvider = ControlProvider();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    onPressed: () => controlProvider.postKey(InputKey.Pause),
                  ),
                ],
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
