import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helper/spacing.dart';

import '../../../../core/theming/app_color.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/typography/font_weight_helper.dart';

class WorkingHoursLinearProgress extends StatelessWidget {
  const WorkingHoursLinearProgress({
    super.key,
    required this.title,
    required this.subtitle,
    required this.progressPercentage,
  });

  final String title;
  final String subtitle;
  final double progressPercentage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Left side: title & subtitle
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppStyles.mediumDarkGrey14.copyWith(
                color: AppColors.fontSecondayColor,
                fontSize: 12.sp,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
            verticalSpace(8),
            Text(
              subtitle,
              style: AppStyles.boldNoColor18.copyWith(
                color: AppColors.fontPrimaryColor,
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.extraBold,
              ),
            ),
          ],
        ),
        const Spacer(),

        // Right side: animated progress bar + percentage
        TweenAnimationBuilder<double>(
          tween: Tween<double>(
            begin: 0,
            end: progressPercentage.clamp(0.0, 1.0),
          ),
          duration: const Duration(milliseconds: 800),
          builder: (context, value, child) {
            return Row(
              children: [
                // Progress bar with border
                Container(
                  width: 120.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade100, width: 1.2),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: LinearProgressIndicator(
                      value: value,
                      backgroundColor: AppColors.emptyCircleProgressColor,
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.blue),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),

                // Percentage text
                Text(
                  "${(value * 100).toStringAsFixed(0)}%",
                  style: TextStyle(
                    color: AppColors.fontPrimaryColor,
                    fontWeight: FontWeightHelper.bold,
                    fontSize: 13.sp,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
