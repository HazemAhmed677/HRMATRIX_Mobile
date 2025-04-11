import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helper/spacing.dart';
import 'package:hrmatrix/features/profile/ui/widgets/common_container_profile.dart';

import '../../../../core/theming/app_color.dart';
import '../../../../core/theming/app_styles.dart';

class LoansTable extends StatelessWidget {
  const LoansTable({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonContainerProfile(
      child: Column(
        children: [
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
        ],
      ),
    );
  }
}
