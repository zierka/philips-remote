import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:philips_remote/classes/api/commands.dart';
import 'package:philips_remote/classes/api/get.dart';
import 'package:philips_remote/classes/models/volume.dart';
import 'package:philips_remote/classes/store/cache.dart';

class VolumeControl extends StatefulWidget {
  VolumeControl({Key key}) : super(key: key);

  @override
  _VolumeControlState createState() => _VolumeControlState();
}

class _VolumeControlState extends State<VolumeControl> {
  double _currentValue = 0;

  int _divisions() {
    // if (Cache.volume != null) {
    return Cache.volume.max - Cache.volume.min;
    // }

    // Cache.volume = Volume(muted: false, current: 10, min: 0, max: 20);

    // return null;
  }

  @override
  void initState() {
    super.initState();

    print("VolumeControl.initState()");

    Get.volume().then((volume) {
      print(volume.toJson());
      _currentValue = volume.current.toDouble();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Slider(
          value: _currentValue.toDouble(),
          min: Cache.volume.min.toDouble(),
          max: Cache.volume.max.toDouble(),
          onChanged: (value) {
            Commands.changeVolume(value.toInt());
            setState(() {
              _currentValue = value;
            });
          },
          onChangeEnd: (value) {
            print(value);
            // Commands.changeVolume(value.toInt());
            setState(() {
              _currentValue = value;
            });
          },
          label: _currentValue.toInt().toString(),
          // divisions: _divisions(),
          activeColor: Theme.of(context).accentColor,
          inactiveColor: Theme.of(context).disabledColor,
        ),
      ),
    );
  }
}
