import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:phimote/logic/models/input_key.dart';
import 'package:phimote/logic/models/volume.dart';
import 'package:phimote/logic/services/commands_repository.dart';
import 'package:phimote/logic/services/info_repository.dart';
import 'package:phimote/logic/services/logging/analytics.dart';
import 'package:phimote/util/utils.dart';
import 'package:phimote/widgets/gesture_pad.dart';

class ControlProvider with ChangeNotifier {
  CommandsRepository get _commandsRepo =>
      GetIt.instance.get<CommandsRepository>();
  InfoRepository get _infoRepo => GetIt.instance.get<InfoRepository>();

  Future<void> postKey(InputKey key) async {
    await _commandsRepo.postKey(key);

    final keyValue = enumValueToString(key);

    Analytics.track("control key tap", properties: {"key": keyValue});
  }

  powerOn() {
    _commandsRepo.powerOn();
  }

  handleGesture(GestureAction action) {
    switch (action) {
      case GestureAction.Up:
        postKey(InputKey.CursorUp);
        break;
      case GestureAction.Down:
        postKey(InputKey.CursorDown);
        break;
      case GestureAction.Left:
        postKey(InputKey.CursorLeft);
        break;
      case GestureAction.Right:
        postKey(InputKey.CursorRight);
        break;
      case GestureAction.Tap:
        postKey(InputKey.Confirm);
        break;
      case GestureAction.End:
        break;
    }
  }

  Future<Volume> currentVolume() => _infoRepo.volume();

  Future<void> changeVolume(int value, {bool mute = false}) async {
    try {
      await _commandsRepo.changeVolume(value, mute: mute);
    } catch (e) {
      //
    }
  }
}
