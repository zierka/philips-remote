import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:phimote/constants/app_colors.dart';
import 'package:phimote/constants/constants.dart';

const _repeatDuration = Duration(milliseconds: 250);

class GesturePad extends StatefulWidget {
  final ValueChanged<GestureAction> onGestureAction;

  GesturePad({this.onGestureAction});

  @override
  _GesturePadState createState() => _GesturePadState();
}

class _GesturePadState extends State<GesturePad> {
  _GestureHandler gestureHandler;

  Timer _dragTimer;
  GestureAction _currentDragAction;

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
      padding: EdgeInsets.only(
        left: Paddings.x2,
        right: Paddings.x2,
        // top: Paddings.x1,
        // bottom: Paddings.x1,
      ),
      child: Container(
        height: 250,
        decoration: BoxDecoration(
          color: AppColors.greyDark,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SizedBox(
          // constraints: BoxConstraints(minHeight: 200, maxHeight: 300),
          child: GestureDetector(
            onTap: _onTap,
            onTapCancel: _onTapCancel,
            onVerticalDragStart: _onVerticalDragStart,
            onVerticalDragUpdate: _onVerticalDragUpdate,
            onVerticalDragEnd: _onDragEnd,
            onVerticalDragCancel: _onVerticalDragCancel,
            onHorizontalDragStart: _onHorizontalDragStart,
            onHorizontalDragUpdate: _onHorizontalDragUpdate,
            onHorizontalDragEnd: _onDragEnd,
            onHorizontalDragCancel: _onHorizontalDragCancel,
            // onPanStart: _onPanStart,
            // onPanUpdate: _onPanUpdate,
            // onPanEnd: _onPanEnd,
            // onPanCancel: _onPanCancel,
            // onPanDown: _onPanDown,
          ),
        ),
      ),
    );
  }

  // TAP

  _onTap() {
    gestureHandler.handleRawGesture(GestureAction.Tap);
    gestureHandler.handleRawGesture(GestureAction.End);
  }

  _onTapCancel() {
    debugPrint("onTapCancel");
  }

  // DRAG

  _onDragEnd(DragEndDetails details) {
    debugPrint(">> _onDragEnd");

    _stopContinousDragAction();
  }

  // vertical drag

  _onVerticalDragStart(DragStartDetails details) {
    debugPrint(">> _onVerticalDragStart");
  }

  _onVerticalDragUpdate(DragUpdateDetails details) {
    debugPrint(">> _onVerticalDragUpdate");

    if (details.primaryDelta.abs() < 2) return;

    final action =
        details.primaryDelta >= 0 ? GestureAction.Down : GestureAction.Up;

    _currentDragAction = action;

    _startContinousDragAction();
  }

  _onVerticalDragCancel() {
    debugPrint(">> _onVerticalDragCancel");
  }

  // horizontal drag

  _onHorizontalDragStart(DragStartDetails details) {
    debugPrint(">> _onHorizontalDragStart");
  }

  _onHorizontalDragUpdate(DragUpdateDetails details) {
    debugPrint(">> _onHorizontalDragUpdate");

    if (details.primaryDelta.abs() < 2) return;

    final action =
        details.primaryDelta >= 0 ? GestureAction.Right : GestureAction.Left;

    _currentDragAction = action;

    _startContinousDragAction();
  }

  _onHorizontalDragCancel() {
    debugPrint(">> _onHorizontalDragCancel");
  }

  // LOGIC

  _startContinousDragAction() {
    if (_dragTimer != null) return;

    _fireDragAction();

    debugPrint(">> _startTimer");

    _dragTimer = Timer.periodic(_repeatDuration, (timer) {
      _fireDragAction();
    });
  }

  _stopContinousDragAction() {
    debugPrint(">> _endTimer");

    _currentDragAction = null;
    _dragTimer.cancel();
    _dragTimer = null;
  }

  _fireDragAction() {
    if (_currentDragAction == null) return;

    gestureHandler.handleRawGesture(_currentDragAction);
  }

  // PAN

  // _onPanStart(DragStartDetails details) {
  //   debugPrint(">> _onPanStart");
  // }

  // _onPanDown(DragDownDetails details) {
  //   debugPrint(">> _onPanDown");
  // }

  // _onPanUpdate(DragUpdateDetails details) {
  //   debugPrint(">> _onPanUpdate");
  // }

  // _onPanEnd(DragEndDetails details) {
  //   debugPrint(">> _onPanEnd");
  // }

  // _onPanCancel() {
  //   debugPrint(">> _onPanCancel");
  // }
}

enum GestureAction { Up, Down, Left, Right, Tap, End }

class _GestureHandler {
  ValueChanged<GestureAction> onGestureAction;
  final stream = StreamController<GestureAction>();
  bool vibrate = false;

  _GestureHandler(this.onGestureAction) {
    stream.stream.listen((action) {
      // print(">> handle gesture $action");
      _executeCommand(action);
      if (vibrate) {
        Vibrate.feedback(FeedbackType.light);
      }
    });
  }

  _executeCommand(GestureAction action) {
    // if (action != GestureAction.End) {
    onGestureAction(action);
    // }
  }

  handleRawGesture(GestureAction action) {
    debugPrint(">> raw gesture $action");

    stream.add(action);
  }
}
