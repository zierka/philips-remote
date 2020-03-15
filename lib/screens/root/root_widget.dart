import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:philips_remote/main_model.dart';
import 'package:philips_remote/screens/content/content_screen.dart';
import 'package:provider/provider.dart';

class RootWidget extends StatelessWidget {
  const RootWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainModel>(
      builder: (context, mainModel, child) {
        if (mainModel.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (mainModel.tv != null) {
          return ContentScreen();
        } else {
          return Center(
            child: Text("no tv found persisted/cant resume/landing stuff"),
          );
        }
      },
    );
  }
}
