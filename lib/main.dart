import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:philips_remote/classes/api/auth.dart';
import 'package:philips_remote/classes/api/commands.dart';
import 'package:philips_remote/classes/store/keystore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Keystore.initialize();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _ipTextController = TextEditingController(text: "192.168.1.");

  PairResponse response;

  void _pair() {
    AuthService.pair().then((response) {
      print("$response");

      this.response = response;

      // _pairConfirm();
    }).catchError((error) {
      print("error: $error");
    });
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
            print("pin $pin");
            Navigator.pop(context);

            final confirmPair = ConfirmPairRequest(response, pin);

            AuthService.confirmPair(confirmPair).then((_) {
              print("confirm pair done");

              // AuthService.confirmPair(confirmPair).then((_) {
              //   print("confirm pair done");
              // });
            });
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text("user\n${Keystore.instance.user}\n"),
              Text("pass\n${Keystore.instance.pass}\n"),
              Text("ip\n${Keystore.instance.ip}\n"),
              TextField(
                controller: _ipTextController,
                decoration: InputDecoration(hintText: "IP ADDRESS"),
                onSubmitted: ((text) {
                  Keystore.instance.ip = text;
                  setState(() {});
                }),
              ),
              CupertinoButton(
                child: Text("RESET"),
                onPressed: () {
                  Keystore.instance.user = null;
                  Keystore.instance.pass = null;
                  Keystore.instance.ip = null;
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
              CupertinoButton(
                child: Text("do example GET"),
                onPressed: () {
                  Commands.getVolume();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
