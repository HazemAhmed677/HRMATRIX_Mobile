import 'package:flutter/material.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/app_color.dart';

class SwipeToExplore extends StatelessWidget {
  const SwipeToExplore({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.swipe, color: AppColors.grey),
        horizontalSpace(4),
        Text("Swipe to explore", style: TextStyle(color: AppColors.grey)),
      ],
    );
  }
}
