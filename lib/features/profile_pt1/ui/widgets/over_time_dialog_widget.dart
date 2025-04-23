import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helpers/spacing.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/core/widgets/custom_logout_button.dart';
import 'package:hrmatrix/core/widgets/custom_text_form_field.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/over_time_hours.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/over_time_start_date.dart';
import 'package:intl/intl.dart';

import '../../../../core/helpers/logger.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/close_widget.dart';
import '../../../requests/ui/widgets/document_dialog_expiration_date.dart';
import '../../../requests/ui/widgets/helpers/show_calendar_dialog.dart';

class OverTimeDialogWidget extends StatefulWidget {
  const OverTimeDialogWidget({super.key});

  @override
  State<OverTimeDialogWidget> createState() => _OverTimeDialogWidgetState();
}

class _OverTimeDialogWidgetState extends State<OverTimeDialogWidget> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  DateTime? _selectedDate;
  TimeOfDay? selectedTime1;
  TimeOfDay? selectedTime2;
  String get formattedDate {
    if (_selectedDate == null) return '';
    return _formatDate(_selectedDate!);
  }

  String _formatDate(DateTime date) {
    return "${_getWeekdayName(date.weekday)} ${_twoDigits(date.day)}/${_twoDigits(date.month)}/${date.year}";
  }

  String _twoDigits(int n) => n.toString().padLeft(2, '0');

  String _getWeekdayName(int weekday) {
    const names = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    return names[weekday - 1];
  }

  void _pickDate() async {
    final picked = await showTableCalendarDialog(context);
    if (picked != null && picked is DateTime) {
      setState(() {
        _selectedDate = picked;
      });
    }
    loggerError(_selectedDate.toString());
  }

  Future<void> _pickTime1() async {
    final now = TimeOfDay.now();
    final picked = await showTimePicker(
      context: context,
      initialTime: selectedTime1 ?? now,
    );

    if (picked != null) {
      setState(() {
        selectedTime1 = picked;
      });
    }
  }

  Future<void> _pickTime2() async {
    final now = TimeOfDay.now();
    final picked = await showTimePicker(
      context: context,
      initialTime: selectedTime2 ?? now,
    );

    if (picked != null) {
      setState(() {
        selectedTime2 = picked;
      });
    }
  }

  String _formatTime(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat.jm().format(dt); // e.g., 5:08 PM
  }

  String _formatTimeForModel(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat.Hms().format(dt); // Returns "01:00:00"
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Request New Over Time",
                      style: AppStyles.primaryStyle.copyWith(
                        fontSize: isLandscape ? 12.sp : 16.sp,
                      ),
                    ),
                    isLandscape ? verticalSpace(8) : verticalSpace(4),
                    Text(
                      "Submit a new overtime request.",
                      style: AppStyles.secondaryStyle.copyWith(
                        fontSize: isLandscape ? 7.sp : 12.sp,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                CloseWidget(),
              ],
            ),
            isLandscape ? verticalSpace(38) : verticalSpace(18),
            CustomTextFormField(
              hint: 'Enter Description',
              label: "Description",
              maxLines: 2,
            ),
            isLandscape ? verticalSpace(48) : verticalSpace(28),
            OverTimeHours(),
            isLandscape ? verticalSpace(48) : verticalSpace(28),
            DocumentDialogExpirationDate(
              hint: _selectedDate != null ? formattedDate : 'Select Date',
              label: 'Over Time Date',
              onTap: _pickDate,
            ),
            isLandscape ? verticalSpace(48) : verticalSpace(28),
            OverTimeStartAndEndDate(
              title: 'Start Time',

              hint:
                  selectedTime1 == null
                      ? 'Select Time'
                      : _formatTime(selectedTime1!),
              onTap: _pickTime1,
            ),
            isLandscape ? verticalSpace(48) : verticalSpace(28),
            OverTimeStartAndEndDate(
              title: 'End Time',
              hint:
                  selectedTime2 == null
                      ? 'Select Time'
                      : _formatTime(selectedTime2!),
              onTap: _pickTime2,
            ),
            isLandscape ? verticalSpace(52) : verticalSpace(32),
            Row(
              children: [
                Expanded(
                  child: CustomActionButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: 'Cancel',
                    edgeColor: AppColors.grey300,
                    backgroundColor: AppColors.white,
                    textColor: AppColors.black,
                    fontSize: isLandscape ? 8 : 12,
                    overlayColor: AppColors.customActionButton,
                    size: Size(
                      MediaQuery.sizeOf(context).width,
                      isLandscape ? 90.h : 40.h,
                    ),
                  ),
                ),
                horizontalSpace(12),
                Expanded(
                  child: CustomActionButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pop(context);
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                    text: 'Request Over Time',
                    edgeColor: AppColors.customActionButton,
                    backgroundColor: AppColors.customActionButton,
                    textColor: AppColors.white,
                    overlayColor: AppColors.white,
                    size: Size(
                      MediaQuery.sizeOf(context).width,
                      isLandscape ? 90.h : 36.h,
                    ),
                    verticalPadding: isLandscape ? 0 : 4,
                    fontSize: isLandscape ? 8 : 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
