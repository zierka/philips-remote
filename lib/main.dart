import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:philips_remote/main_model.dart';
import 'package:philips_remote/screens/root/root_widget.dart';
import 'package:provider/provider.dart';

void main() async {
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
    return FutureProvider(
      create: (context) => MainModel.load(),
      initialData: MainModel.isLoading(),
      child: RootWidget(),
    );
  }
}
