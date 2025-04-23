import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_styles.dart';

class OverTimeStartAndEndDate extends StatefulWidget {
  const OverTimeStartAndEndDate({
    super.key,
    required this.title,
    required this.hint,
  });
  final String title;
  final String hint;
  @override
  State<OverTimeStartAndEndDate> createState() =>
      _OverTimeStartAndEndDateState();
}

class _OverTimeStartAndEndDateState extends State<OverTimeStartAndEndDate> {
  TimeOfDay? selectedTime;

  Future<void> _pickTime() async {
    final now = TimeOfDay.now();
    final picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? now,
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  String _formatTime(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat.jm().format(dt); // e.g., 5:08 PM
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppStyles.secondaryStyle.copyWith(
            fontSize: isLandscape ? 7.sp : 12.sp,
          ),
        ),
        isLandscape ? verticalSpace(24) : verticalSpace(12),

        GestureDetector(
          onTap: _pickTime,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: isLandscape ? 10.w : 16.w,
              vertical: 14.h,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              border: Border.all(color: const Color(0xFFD1D5DB)),
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
                  selectedTime == null
                      ? widget.hint
                      : _formatTime(selectedTime!),
                  style: AppStyles.primaryStyle.copyWith(
                    fontSize: isLandscape ? 9.sp : 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
