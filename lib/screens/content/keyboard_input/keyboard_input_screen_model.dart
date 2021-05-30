import 'package:get_it/get_it.dart';
import 'package:phimote/logic/services/commands_repository.dart';

class KeyboardInputScreenModel {
  bool alternateInputMode = false;

  String lastInputText = "";

  CommandsRepository get commandsRepo =>
      GetIt.instance.get<CommandsRepository>();

  submitText(String text) {
    commandsRepo.sendText(text, search: true);
  }

  textChanged(String text) {
    if (alternateInputMode) {
      final diff = text.replaceFirst(lastInputText, "");
      print(">> diff $diff");

      lastInputText = text;
      commandsRepo.postString(diff);
    } else {
      commandsRepo.sendText(text);
      lastInputText = text;
    }
  }
}
