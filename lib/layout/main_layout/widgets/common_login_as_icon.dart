import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hrmatrix/core/helper/spacing.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/core/theming/app_styles.dart';

class CommonLoginAsIcon extends StatelessWidget {
  const CommonLoginAsIcon({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.fontPrimaryColor,
            radius: 21.r,
            child: CircleAvatar(
              backgroundColor: AppColors.emptyCircleProgressColor,
              radius: 20.r,
              child: Icon(
                FontAwesomeIcons.user,
                color: AppColors.fontPrimaryColor,
              ),
            ),
          ),
          horizontalSpace(8),

          Text(
            title,
            style: AppStyles.boldNoColor18.copyWith(
              color: AppColors.fontPrimaryColor,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
