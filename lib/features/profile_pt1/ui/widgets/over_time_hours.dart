import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helpers/spacing.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../core/theming/app_styles.dart';
import '../../../requests/data/models/over_time_request_model.dart';

class OverTimeHours extends StatefulWidget {
  const OverTimeHours({super.key});

  @override
  State<OverTimeHours> createState() => _OverTimeHoursState();
}

class _OverTimeHoursState extends State<OverTimeHours> {
  double overtime = 0.1;
  String? _errorText;

  void _increment() {
    setState(() {
      overtime += 0.1;
      overtime = double.parse(overtime.toStringAsFixed(1));
      context.read<OverTimeRequestModel>().overTime = overtime;
      _errorText = null;
    });
  }

  void _decrement() {
    setState(() {
      if (overtime > 0.1) {
        overtime -= 0.1;
        overtime = double.parse(overtime.toStringAsFixed(1));
        context.read<OverTimeRequestModel>().overTime = overtime;
        _errorText = null;
      } else {
        overtime = 0.0;
        _errorText = "Overtime cannot be zero.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Overtime Hours",
          style: AppStyles.secondaryStyle.copyWith(
            fontSize: isLandscape ? 7.sp : 12.sp,
          ),
        ),
        isLandscape ? verticalSpace(24) : verticalSpace(12),
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
                style: AppStyles.primaryStyle.copyWith(
                  fontSize: isLandscape ? 9.sp : 12.sp,
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  GestureDetector(
                    onTap: _increment,
                    child: Icon(
                      LucideIcons.chevronUp,
                      size: isLandscape ? 10.sp : 12.sp,
                    ),
                  ),
                  GestureDetector(
                    onTap: _decrement,
                    child: Icon(
                      LucideIcons.chevronDown,
                      size: isLandscape ? 10.sp : 12.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (_errorText != null) ...[
          verticalSpace(8),
          Text(
            _errorText!,
            style: TextStyle(
              color: Colors.red,
              fontSize: isLandscape ? 7.sp : 10.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }
}
