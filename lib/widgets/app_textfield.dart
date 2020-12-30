import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:phimote/constants/constants.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool autofocus;

  const AppTextField({
    Key key,
    this.controller,
    this.keyboardType,
    this.autofocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformTextField(
      cupertino: (context, platform) => CupertinoTextFieldData(
        cursorColor: AppColors.accentColor,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      material: (context, platform) => MaterialTextFieldData(
        cursorColor: AppColors.accentColor,
      ),
      controller: controller,
      keyboardType: keyboardType,
      autofocus: autofocus,
    );
  }
}
