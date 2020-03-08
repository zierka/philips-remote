import 'dart:async';
import 'package:flutter/material.dart';
import 'package:philips_remote/services/api/key_input.dart';
import 'package:vibrate/vibrate.dart';

class GesturePad extends StatefulWidget {
  @override
  _GesturePadState createState() => _GesturePadState();
}

class _GesturePadState extends State<GesturePad> {
  final gestureHandler = _GestureHandler();

  @override
  void initState() {
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
  final stream = StreamController<GestureAction>();
  bool vibrate = false;

  _GestureHandler() {
    print("yolo");

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
    switch (action) {
      case GestureAction.Up:
        KeyInput.postKey(InputKey.CursorUp);
        break;
      case GestureAction.Down:
        KeyInput.postKey(InputKey.CursorDown);
        break;
      case GestureAction.Left:
        KeyInput.postKey(InputKey.CursorLeft);
        break;
      case GestureAction.Right:
        KeyInput.postKey(InputKey.CursorRight);
        break;
      case GestureAction.Tap:
        KeyInput.postKey(InputKey.Confirm);
        break;
      case GestureAction.End:
        break;
    }
  }

  handleRawGesture(GestureAction action) {
    stream.add(action);
    // print(">> 1 handle gesture $action");
    // print("> ${GestureAction.End == GestureAction.End}");
  }
}
