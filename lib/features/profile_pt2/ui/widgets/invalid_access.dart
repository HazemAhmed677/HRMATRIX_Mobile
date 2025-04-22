import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/common_container_profile.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_styles.dart';

class InvalidAccess extends StatelessWidget {
  const InvalidAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(38),

        CommonContainerProfile(
          child: Column(
            children: [
              verticalSpace(38),

              Text(
                'Invalid Access',
                style: AppStyles.primaryStyle.copyWith(fontSize: 9.sp),
              ),
              verticalSpace(22),
              Text(
                'This section is only available for part-time employees.',
                style: AppStyles.secondaryStyle.copyWith(fontSize: 7.sp),
              ),
              verticalSpace(38),
            ],
          ),
        ),
      ],
    );
  }
}
