import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/core/theming/app_styles.dart';
import 'package:hrmatrix/features/home/ui/widgets/top_half_circle_progress_painter.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/typography/font_weight_helper.dart';
import '../../../../core/widgets/common_container.dart';
import 'working_hours_linear_progress.dart'; // Add this package

class WorkingHoursComponent extends StatelessWidget {
  final double progressPercentage;

  const WorkingHoursComponent({super.key, required this.progressPercentage});

  @override
  Widget build(BuildContext context) {
    return CommonContainer(
      title: "Working Hours",
      titleFontSize: 17,
      titleFontWeight: FontWeightHelper.bold,
      subtitle: "How many hours have you been working",
      child: Column(
        children: [
          verticalSpace(26),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(
                begin: 0,
                end: progressPercentage.clamp(0.0, 1.0),
              ),
              duration: Duration(milliseconds: 800),
              builder: (context, animatedValue, child) {
                return Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    CustomPaint(
                      size: Size(250.w, 125.h),
                      painter: TopHalfProgressPainter(
                        percent: animatedValue,
                        progressColor: AppColors.blue,
                        backgroundColor: AppColors.emptyCircleProgressColor,
                      ),
                    ),
                    Positioned(
                      top: 62.h.h,
                      child: Column(
                        children: [
                          Text(
                            "No Clock-in Today",
                            style: AppStyles.boldSecondaryColor22.copyWith(
                              color: AppColors.fontPrimaryColor,
                              fontSize: 16.sp,
                            ),
                          ),
                          verticalSpace(4),
                          Text(
                            "Hours",
                            style: AppStyles.boldSecondaryColor22.copyWith(
                              color: AppColors.fontSecondayColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeightHelper.regular,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Divider(height: 52.h, thickness: 1, color: AppColors.grey200),
          WorkingHoursLinearProgress(
            title: 'Attended',
            progressPercentage: 0.1,
            subtitle: '0 / 0',
          ),
          verticalSpace(16),
          WorkingHoursLinearProgress(
            title: 'Working Remotly',
            progressPercentage: 0.1,
            subtitle: '0 / 0',
          ),
        ],
      ),
    );
  }
}
