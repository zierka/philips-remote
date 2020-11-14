import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'root_model.dart';
import 'package:phimote/screens/content/content_screen.dart';
import 'package:phimote/screens/landing/landing_screen.dart';
import 'package:phimote/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class RootWidget extends StatelessWidget {
  const RootWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RootModel>(
      builder: (context, model, child) {
        return model.state.when(loading: () {
          return Center(
            child: LoadingIndicator(),
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
