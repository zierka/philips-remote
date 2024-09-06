import 'dart:io';

import 'package:dart_ping_ios/dart_ping_ios.dart';
import 'package:flutter/cupertino.dart' hide RootWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:phimote/logic/services/logging/analytics.dart';
import 'package:phimote/logic/services/logging/log.dart';
import 'package:flutter/material.dart' hide RootWidget;
import 'package:phimote/constants/app_colors.dart';
import 'package:phimote/screens/root/root_widget.dart';
import 'package:provider/provider.dart';
import 'screens/root/root_model.dart';

void main() {
  if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }

  WidgetsFlutterBinding.ensureInitialized();

  Log.configure();
  Analytics.configure();

  // Register dart_ping_ios with dart_ping
  if (Platform.isIOS) DartPingIOS.register();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final brightness = Brightness.dark;
    final primaryColor = AppColors.primaryColor;
    final accentColor = AppColors.accentColor;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.backgroundColor,
      ),
    );

    final themeData = ThemeData(
      brightness: brightness,
      primaryColor: primaryColor,
      // accentColor: accentColor,
      splashColor: Platform.isIOS ? Colors.transparent : null,
      // appBarTheme: AppBarTheme(brightness: brightness),
      textTheme: TextTheme(
        bodyMedium: TextStyle(color: AppColors.white),
        labelMedium: TextStyle(color: accentColor),
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
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
