import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helper/spacing.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/core/theming/app_styles.dart';
import 'package:hrmatrix/core/typography/font_weight_helper.dart';

class CommonContainer extends StatelessWidget {
  const CommonContainer({
    super.key,
    required this.title,
    this.subtitle,
    this.child,
    this.titleFontSize = 24,
    this.titleFontWeight = FontWeightHelper.extraBold,
  });
  final String title;
  final String? subtitle;
  final Widget? child;
  final double titleFontSize;
  final FontWeight titleFontWeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.boldNoColor18.copyWith(
              color: AppColors.fontPrimaryColor,
              fontSize: titleFontSize.sp,
              fontWeight: titleFontWeight,
            ),
          ),
          if (subtitle != null) verticalSpace(10),
          if (subtitle != null)
            Text(
              subtitle!,
              style: AppStyles.mediumDarkGrey14.copyWith(
                color: AppColors.fontSecondayColor,
              ),
            ),
          if (child != null) verticalSpace(8),
          if (child != null) child!,
        ],
      ),
    );
  }
}
