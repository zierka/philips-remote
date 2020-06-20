import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:philips_remote/main/main_model.dart';
import 'package:philips_remote/screens/root/root_widget.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final brightness = Brightness.light;
    final primaryColor = Colors.deepOrange;
    final backgroundColor = Colors.yellow;

    final themeData = ThemeData(
      brightness: brightness,
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      splashColor: Colors.transparent,
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: brightness,
        primaryColor: primaryColor,
      ),
    );

    final cupertinoTheme =
        MaterialBasedCupertinoThemeData(materialTheme: themeData);

    return PlatformApp(
      title: 'Philips TV remote controller',
      ios: (_) => CupertinoAppData(theme: cupertinoTheme),
      android: (_) => MaterialAppData(theme: themeData),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainModel>(
      create: (context) => MainModel(),
      child: RootWidget(),
    );
  }
}

///////

class NoSplashFactory extends InteractiveInkFeatureFactory {
  const NoSplashFactory();

  @override
  InteractiveInkFeature create({
    MaterialInkController controller,
    RenderBox referenceBox,
    Offset position,
    Color color,
    TextDirection textDirection,
    bool containedInkWell = false,
    rectCallback,
    BorderRadius borderRadius,
    ShapeBorder customBorder,
    double radius,
    onRemoved,
  }) {
    return NoSplash(
      controller: controller,
      referenceBox: referenceBox,
    );
  }
}

class NoSplash extends InteractiveInkFeature {
  NoSplash({
    @required MaterialInkController controller,
    @required RenderBox referenceBox,
  })  : assert(controller != null),
        assert(referenceBox != null),
        super(
          controller: controller,
          referenceBox: referenceBox,
        );

  @override
  void paintFeature(Canvas canvas, Matrix4 transform) {}
}
