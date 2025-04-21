import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/app_color.dart';
import '../../../../core/theming/app_styles.dart';

class NoDataAvailable extends StatelessWidget {
  const NoDataAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(12),
        Icon(Icons.info, color: AppColors.fontPrimaryColor, size: 10.sp),
        verticalSpace(22),
        Text(
          'No Data Available',
          style: AppStyles.primaryStyle.copyWith(fontSize: 8.sp),
        ),
        verticalSpace(10),

        Text(
          "It looks like there's nothing to show here.",
          style: AppStyles.secondaryStyle.copyWith(fontSize: 8.sp),
        ),
        verticalSpace(12),
      ],
    );
  }
}
