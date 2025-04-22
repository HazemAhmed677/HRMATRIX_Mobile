import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_color.dart';
import '../../../../core/theming/app_styles.dart';

class SignWord extends StatelessWidget {
  const SignWord({
    super.key,
    required this.title,
    required this.subTitle,
    required this.height,
  });
  final String title;
  final String subTitle;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(height),
        Text(
          title,
          style: AppStyles.semiBoldDarkGrey16.copyWith(
            color: AppColors.fontPrimaryColor,
            fontSize: 22.sp,
          ),
        ),
        verticalSpace(2),
        Text(
          subTitle,
          style: AppStyles.semiBoldDarkGrey16.copyWith(
            fontSize: 15.sp,
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }
}
