import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class GesturePad extends StatefulWidget {
  final ValueChanged<GestureAction> onGestureAction;

  GesturePad({this.onGestureAction});

  @override
  _GesturePadState createState() => _GesturePadState();
}

class _GesturePadState extends State<GesturePad> {
  _GestureHandler gestureHandler;

  @override
  void initState() {
    gestureHandler = _GestureHandler(widget.onGestureAction);
    _init();
    super.initState();
  }

  _init() async {
    bool canVibrate = await Vibrate.canVibrate;
    gestureHandler.vibrate = canVibrate;
  }

  @override
  void dispose() {
    gestureHandler.stream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: Container(
        height: 250,
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: GestureDetector(
          onTap: () {
            gestureHandler.handleRawGesture(GestureAction.Tap);
            gestureHandler.handleRawGesture(GestureAction.End);
          },
          // onVerticalDragStart: (details) {
          //   print("onVerticalDragStart");
          // },
          onVerticalDragUpdate: (details) {
            // print("onVerticalDragUpdate ${details.delta.direction}");
            if (details.delta.dy > 0) {
              gestureHandler.handleRawGesture(GestureAction.Down);
            } else {
              gestureHandler.handleRawGesture(GestureAction.Up);
            }
          },
          onVerticalDragEnd: (details) {
            gestureHandler.handleRawGesture(GestureAction.End);
          },
          // onVerticalDragCancel: () {
          //   print("onVerticalDragCancel");
          // },
          // onHorizontalDragStart: (details) {
          //   print("onHorizontalDragStart");
          // },
          onHorizontalDragUpdate: (details) {
            if (details.delta.dx > 0) {
              gestureHandler.handleRawGesture(GestureAction.Right);
            } else {
              gestureHandler.handleRawGesture(GestureAction.Left);
            }
          },
          onHorizontalDragEnd: (details) {
            gestureHandler.handleRawGesture(GestureAction.End);
          },
          // onHorizontalDragCancel: () {
          //   print("onHorizontalDragCancel");
          // },
          // onPanStart: (details) {
          //   print(">> onPanStart");
          // },
          // onPanUpdate: (details) {
          //   print(">> onPanUpdate ${details.delta}");

          //   if (details.delta.dx > 0)
          //     gestureHandler.handleGesture(GestureAction.Right);
          //   else
          //     gestureHandler.handleGesture(GestureAction.Left);

          //   if (details.delta.dy > 0)
          //     gestureHandler.handleGesture(GestureAction.Down);
          //   else
          //     gestureHandler.handleGesture(GestureAction.Up);
          // },
          // onPanEnd: (details) {
          //   print(">> onPanEnd");
          // },
        ),
      ),
    );
  }
}

enum GestureAction { Up, Down, Left, Right, Tap, End }

class _GestureHandler {
  ValueChanged<GestureAction> onGestureAction;
  final stream = StreamController<GestureAction>();
  bool vibrate = false;

  _GestureHandler(this.onGestureAction) {
    stream.stream.distinct().where((a) {
      return a != GestureAction.End;
    }).listen((action) {
      print(">> 2 handle gesture $action");
      _executeCommand(action);
      if (vibrate) {
        Vibrate.feedback(FeedbackType.light);
      }
    });
  }

  _executeCommand(GestureAction action) {
    if (action != GestureAction.End) {
      onGestureAction(action);
    }
  }

  handleRawGesture(GestureAction action) {
    stream.add(action);
  }
}
