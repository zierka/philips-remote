import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:philips_remote/classes/store/keystore.dart';
import 'package:philips_remote/classes/ui/screen/container/content_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // RemoteClient.setup();

  await Keystore.initialize();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Philips TV remote controller',
      theme: ThemeData(
        accentColor: Colors.white,
        primaryColor: Colors.black,
        backgroundColor: Colors.grey,
        scaffoldBackgroundColor: Colors.black,
        disabledColor: Colors.grey[800],
        splashColor: Colors.transparent,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
            ),
        highlightColor: Color.fromRGBO(255, 111, 97, 1),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContentScreen();
  }
}
