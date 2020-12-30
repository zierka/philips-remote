import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

import 'control_button.dart';

/// [onPressed] called repeatedly on long tap until touch up/cancel.
class ContinuousControlButton extends StatefulWidget {
  final Widget child;
  final Color color;
  final VoidCallback onPressed;

  ContinuousControlButton({
    @required this.child,
    this.color,
    @required this.onPressed,
  });

  @override
  _ContinuousControlButtonState createState() =>
      _ContinuousControlButtonState();
}

class _ContinuousControlButtonState extends State<ContinuousControlButton> {
  Timer firstTimer;
  Timer periodicTimer;

  @override
  Widget build(BuildContext context) {
    // GestureDetector onTapDown has a slight delay so it doesn't recognise quick taps
    return Listener(
      onPointerDown: (details) => _onTapDown(),
      onPointerUp: (e) => _onTapCancel(),
      onPointerCancel: (e) => _onTapCancel(),
      child: ControlButton(
        child: widget.child,
        color: widget.color,
        onPressed: () {},
      ),
    );
  }

  _onTapDown() {
    _onPressed();

    firstTimer = Timer(Duration(milliseconds: 300), () {
      _runPeriodicTimer();
    });
  }

  _onTapCancel() {
    firstTimer?.cancel();
    periodicTimer?.cancel();
  }

  _runPeriodicTimer() {
    periodicTimer = Timer.periodic(Duration(milliseconds: 150), (timer) {
      _onPressed();
    });
  }

  _onPressed() {
    widget.onPressed();
    Vibrate.feedback(FeedbackType.light);
  }
}
