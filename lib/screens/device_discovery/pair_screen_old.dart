import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phimote/logic/models/auth/pair_response.dart';
import 'package:phimote/data_access/persistence/preference_store.dart';
import 'package:phimote/widgets/navigation_bar.dart';

class PairScreenOld extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PairScreenOld> {
  final _ipTextController = TextEditingController(text: "192.168.1.");

  PairResponse response;

  void _pair() {
    // AuthService.pair().then((response) {
    //   print("$response");

    //   this.response = response;
    // }).catchError((error) {
    //   print("error: $error");
    // });
  }

  void _pairConfirm() {
    final controller = TextEditingController();
    final textField = CupertinoTextField(
        controller: controller, keyboardType: TextInputType.number);

    final dialog = CupertinoAlertDialog(
      title: Text("Enter PIN"),
      content: textField,
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text("OK"),
          onPressed: () {
            final pin = textField.controller.text;
            debugPrint("pin $pin");
            Navigator.pop(context);

            // final confirmPair = ConfirmPairRequest(response, pin);

            // AuthService.confirmPair(confirmPair).then((_) {
            //   print("confirm pair done");
            // });
          },
        )
      ],
    );

    showCupertinoDialog(
      context: context,
      builder: (context) => dialog,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBar(
        title: Text("pair"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Text("user\n${Keystore.instance.user}\n"),
              // Text("pass\n${Keystore.instance.pass}\n"),
              // Text("ip\n${Keystore.instance.ip}\n"),
              TextField(
                controller: _ipTextController,
                decoration: InputDecoration(hintText: "IP ADDRESS"),
                onSubmitted: ((text) {
                  // Keystore.instance.ip = text;
                  setState(() {});
                }),
              ),
              CupertinoButton(
                child: Text("RESET"),
                onPressed: () {
                  final store = PreferenceStore();
                  store.session = null;
                  setState(() {});
                },
              ),
              CupertinoButton(
                child: Text("PAIR"),
                onPressed: _pair,
              ),
              CupertinoButton(
                child: Text("PAIR CONFIRM"),
                onPressed: _pairConfirm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
