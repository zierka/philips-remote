import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phimote/constants/ui_constants.dart';
import 'package:phimote/logic/models/volume.dart';
import 'package:phimote/widgets/control_button.dart';

class VolumeControl extends StatefulWidget {
  final ValueChanged<double> onChanged;
  final VoidCallback onVolumeDownPressed;
  final VoidCallback onVolumeUpPressed;

  VolumeControl({
    this.onChanged,
    @required this.onVolumeDownPressed,
    @required this.onVolumeUpPressed,
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
        padding: const EdgeInsets.symmetric(horizontal: Paddings.x2),
        child: Row(
          children: <Widget>[
            ControlButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  _currentValue--;
                });
                widget.onVolumeDownPressed();
              },
            ),
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: Slider(
                  activeColor: Colors.deepOrange,
                  inactiveColor: Colors.deepOrange.shade100,
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
                ),
              ),
            ),
            ControlButton(
              icon: Icon(Icons.add),
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
