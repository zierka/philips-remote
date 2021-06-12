import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:phimote/constants/constants.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool autofocus;
  final Function(String) onSubmitted;

  const AppTextField({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.autofocus,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformTextField(
      cursorHeight: 18,
      cupertino: (context, platform) => CupertinoTextFieldData(
        cursorColor: AppColors.accentColor,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      material: (context, platform) => MaterialTextFieldData(
        cursorColor: AppColors.accentColor,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.accentColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.accentColor),
          ),
        ),
      ),
      controller: controller,
      keyboardType: keyboardType,
      autofocus: autofocus,
      onSubmitted: onSubmitted,
    );
  }
}
