import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:phimote/constants/app_colors.dart';

class TitleButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const TitleButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PlatformButton(
        materialFlat: (context, platform) => MaterialFlatButtonData(
          splashColor: AppColors.accentColor.withOpacity(0.4),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.button?.copyWith(
                color: AppColors.accentColor,
              ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
