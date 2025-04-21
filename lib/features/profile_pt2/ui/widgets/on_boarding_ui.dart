import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/theming/app_styles.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/common_container_profile.dart';

class OnBoardingUI extends StatelessWidget {
  const OnBoardingUI({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonContainerProfile(
      child: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Text(
          'Onboarding has not been started yet.',
          style: AppStyles.primaryStyle.copyWith(fontSize: 15.sp),
        ),
      ),
    );
  }
}
