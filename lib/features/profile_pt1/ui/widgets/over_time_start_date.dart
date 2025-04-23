import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_styles.dart';

class OverTimeStartAndEndDate extends StatelessWidget {
  const OverTimeStartAndEndDate({
    super.key,
    required this.title,
    required this.hint,
    this.onTap,
    this.errorText,
  });

  final String title;
  final String hint;
  final void Function()? onTap;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.secondaryStyle.copyWith(
            fontSize: isLandscape ? 7.sp : 12.sp,
          ),
        ),
        isLandscape ? verticalSpace(24) : verticalSpace(12),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: isLandscape ? 10.w : 16.w,
              vertical: 14.h,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              border: Border.all(
                color: errorText != null ? Colors.red : const Color(0xFFD1D5DB),
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Icon(
                  LucideIcons.clock,
                  color: const Color(0xFF6B7280),
                  size: isLandscape ? 8.sp : 12.sp,
                ),
                isLandscape ? horizontalSpace(2) : horizontalSpace(10),
                Text(
                  hint,
                  style: AppStyles.primaryStyle.copyWith(
                    fontSize: isLandscape ? 9.sp : 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (errorText != null) ...[
          verticalSpace(4),
          Text(
            errorText!,
            style: TextStyle(color: Colors.red, fontSize: 10.sp),
          ),
        ],
      ],
    );
  }
}
