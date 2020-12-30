import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:phimote/constants/app_colors.dart';
import 'package:phimote/screens/root/root_widget.dart';
import 'package:provider/provider.dart';

import 'screens/root/root_model.dart';

void main() async {
  if (kReleaseMode) {
    debugPrint = (String message, {int wrapWidth}) {};
  }

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

    return ChangeNotifierProvider<RootModel>(
      create: (context) => RootModel(),
      child: MaterialApp(
        title: 'Phimote',
        theme: themeData,
        home: RootWidget(),
      ),
    );
  }
}
