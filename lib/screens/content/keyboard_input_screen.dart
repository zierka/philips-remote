import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:phimote/constants/constants.dart';
import 'package:phimote/logic/services/commands_repository.dart';
import 'package:phimote/widgets/control_button.dart';

class KeyboardInputScreen extends StatelessWidget {
  final VoidCallback onFinished;

  const KeyboardInputScreen({
    Key key,
    @required this.onFinished,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final commandsRepo = GetIt.instance.get<CommandsRepository>();

    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            onFinished();
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(Paddings.x2),
        child: TextField(
          cursorColor: AppColors.accentColor,
          autofocus: true,
          onSubmitted: (string) {
            commandsRepo.sendText(string, search: true);
            onFinished();
          },
          onChanged: (string) {
            commandsRepo.sendText(string);
          },
        ),
      ),
    );
  }
}
