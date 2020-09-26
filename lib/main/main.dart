import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phimote/constants/app_colors.dart';
import 'package:phimote/main/main_model.dart';
import 'package:phimote/screens/root/root_widget.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final brightness = Brightness.dark;
    final primaryColor = AppColors.primaryColor;
    final accentColor = AppColors.accentColor;

    final themeData = ThemeData(
      brightness: brightness,
      primaryColor: primaryColor,
      accentColor: accentColor,
      splashColor: Platform.isIOS ? Colors.transparent : null,
      appBarTheme: AppBarTheme(brightness: brightness),
      textTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.white),
      ),
      scaffoldBackgroundColor: AppColors.backgroundColor,
      cupertinoOverrideTheme: CupertinoThemeData(
        primaryColor: primaryColor,
      ),
    );

    return ChangeNotifierProvider<MainModel>(
      create: (context) => MainModel(),
      child: MaterialApp(
        title: 'Philips TV remote controller',
        theme: themeData,
        home: RootWidget(),
      ),
    );
  }
}
