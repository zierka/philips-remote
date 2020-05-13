import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:philips_remote/main/main_model.dart';
import 'package:philips_remote/screens/content/content_screen.dart';
import 'package:philips_remote/screens/landing/landing_screen.dart';
import 'package:provider/provider.dart';

class RootWidget extends StatelessWidget {
  const RootWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainModel>(
      builder: (context, mainModel, child) {
        return mainModel.state.when(loading: () {
          return Center(
            child: CircularProgressIndicator(),
          );
        }, content: (tv) {
          return ContentScreen();
        }, landing: () {
          return LandingScreen();
        });
      },
    );
  }
}
