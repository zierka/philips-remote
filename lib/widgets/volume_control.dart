import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phimote/constants/constants.dart';
import 'package:phimote/constants/ui_constants.dart';
import 'package:phimote/logic/models/input_key.dart';
import 'package:phimote/logic/models/volume.dart';
import 'package:phimote/screens/content/content_screen_model.dart';
import 'package:phimote/screens/content/control_provider.dart';
import 'package:phimote/widgets/control_button.dart';
import 'package:phimote/widgets/selectable_button.dart';
import 'package:provider/provider.dart';

class VolumeControl extends StatefulWidget {
  VolumeControl({key}) : super(key: key);

  @override
  _VolumeControlState createState() => _VolumeControlState();
}

class _VolumeControlState extends State<VolumeControl> {
  Volume volume = Volume(current: 0, muted: false, min: 0, max: 40);

  ControlProvider controlProvider;

  @override
  void initState() {
    super.initState();

    controlProvider = context.read<ControlProvider>();

    final contentScreenModel = context.read<ContentScreenModel>();

    contentScreenModel.connectedStream.listen((isConnected) {
      if (isConnected) {
        _loadVolume();
      }
    });
  }

  _loadVolume() async {
    volume = await controlProvider.currentVolume();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ControlProvider>(
      builder: (context, controlProvider, _) => Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Paddings.x2),
          child: Row(
            children: <Widget>[
              SelectableButton(
                selected: volume.muted,
                title: "MUTE",
                enabledTitle: "MUTED",
                onPressed: (selected) async {
                  await controlProvider.postKey(InputKey.Mute);
                  await _loadVolume();
                },
              ),
              ControlButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    volume.current--;
                  });

                  controlProvider.postKey(InputKey.VolumeDown);
                },
              ),
              Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: Slider(
                    activeColor: Colors.deepOrange,
                    inactiveColor: Colors.deepOrange.shade100,
                    value: volume.current.toDouble(),
                    min: volume.min.toDouble(),
                    max: volume.max.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        volume.current = value.toInt();
                      });
                      controlProvider.changeVolume(value.toInt());
                    },
                    onChangeEnd: (value) {
                      setState(() {
                        volume.muted = false;
                      });
                    },
                  ),
                ),
              ),
              ControlButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    volume.current++;
                  });
                  controlProvider.postKey(InputKey.VolumeUp);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
