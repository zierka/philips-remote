import 'package:get_it/get_it.dart';
import 'package:philips_remote/data/models/input_key.dart';
import 'package:philips_remote/services/repositories/tv/commands_repository.dart';
import 'package:philips_remote/widgets/gesture_pad.dart';

class ControlScreenModel {
  final _commandsRepo = GetIt.instance.get<CommandsRepository>();

  postKey(InputKey key) {
    _commandsRepo.postKey(key);
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

  Future<void> changeVolume(int value, {bool mute = false}) async {
    return _commandsRepo.changeVolume(value, mute: mute);
  }
}
