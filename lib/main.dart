import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:philips_remote/classes/network/remote_client.dart';
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
        primarySwatch: Colors.blue,
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
