import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:philips_remote/logic/models/volume.dart';

class VolumeControl extends StatefulWidget {
  final ValueChanged<double> onChanged;
  final VoidCallback onVolumeDownPressed;
  final VoidCallback onVolumeUpPressed;

  VolumeControl({
    this.onChanged,
    this.onVolumeDownPressed,
    this.onVolumeUpPressed,
    key,
  }) : super(key: key);

  @override
  _VolumeControlState createState() => _VolumeControlState();
}

class _VolumeControlState extends State<VolumeControl> {
  double _currentValue = 0;
  Volume volume = Volume(muted: false, min: 0, max: 40);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.remove),
              color: Theme.of(context).accentColor,
              onPressed: () {
                setState(() {
                  _currentValue--;
                });
                widget.onVolumeDownPressed();
              },
            ),
            Expanded(
              child: Slider(
                value: _currentValue.toDouble(),
                min: volume.min.toDouble(),
                max: volume.max.toDouble(),
                onChanged: (value) {
                  setState(() {
                    _currentValue = value;
                  });

                  widget.onChanged(value);
                },
                onChangeEnd: (value) {
                  setState(() {
                    _currentValue = value;
                  });
                },
                label: _currentValue.toInt().toString(),
                activeColor: Theme.of(context).accentColor,
                inactiveColor: Theme.of(context).disabledColor,
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              color: Theme.of(context).accentColor,
              onPressed: () {
                setState(() {
                  _currentValue++;
                });
                widget.onVolumeUpPressed();
              },
            ),
          ],
        ),
      ),
    );
  }
}
