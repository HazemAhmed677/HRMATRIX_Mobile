import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helpers/spacing.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../core/theming/app_styles.dart';

class OverTimeHours extends StatefulWidget {
  const OverTimeHours({super.key});

  @override
  State<OverTimeHours> createState() => _OverTimeHoursState();
}

class _OverTimeHoursState extends State<OverTimeHours> {
  double overtime = 1.0;

  void _increment() {
    setState(() {
      overtime += 0.1;
      overtime = double.parse(overtime.toStringAsFixed(1));
    });
  }

  void _decrement() {
    setState(() {
      if (overtime > 0.1) {
        overtime -= 0.1;
        overtime = double.parse(overtime.toStringAsFixed(1));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          "Overtime Hours:",
          style: AppStyles.secondaryStyle.copyWith(fontSize: 7.sp),
        ),
        verticalSpace(24),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: const Color(0xFFF9FAFB),
            border: Border.all(color: const Color(0xFFD1D5DB)),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: [
              Text(
                overtime.toStringAsFixed(1),
                style: AppStyles.primaryStyle.copyWith(fontSize: 9.sp),
              ),
              const Spacer(),
              Column(
                children: [
                  GestureDetector(
                    onTap: _increment,
                    child: Icon(LucideIcons.chevronUp, size: 10.sp),
                  ),
                  GestureDetector(
                    onTap: _decrement,
                    child: Icon(LucideIcons.chevronDown, size: 10.sp),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
