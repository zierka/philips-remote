import 'package:flutter/material.dart';
import 'package:phimote/constants/constants.dart';

import 'widget_load_state.dart';

class EmptyStateWidget extends StatelessWidget {
  final EmptyStateData data;

  const EmptyStateWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Paddings.x4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 174,
            width: 174,
            decoration: ShapeDecoration(
              // color: AppColors.brownLight,
              shape: CircleBorder(),
            ),
          ),
          SizedBox(height: Paddings.x2),
          Text(
            data.title,
            textAlign: TextAlign.center,
            // style: TextStyles.heading5Medium,
          ),
          SizedBox(height: Paddings.x1),
          Text(
            data.text,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
