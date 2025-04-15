import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helper/logger.dart';
import 'package:hrmatrix/core/helper/spacing.dart';
import 'package:hrmatrix/core/widgets/custom_text_form_field.dart';
import 'package:hrmatrix/features/profile/ui/widgets/helpers/show_calendar_dialog.dart';

import '../../../../core/theming/app_styles.dart';

class DocumentDialogExpirationDate extends StatefulWidget {
  const DocumentDialogExpirationDate({super.key});

  @override
  State<DocumentDialogExpirationDate> createState() =>
      _DocumentDialogExpirationDateState();
}

class _DocumentDialogExpirationDateState
    extends State<DocumentDialogExpirationDate> {
  DateTime? _selectedDate;

  String get formattedDate {
    if (_selectedDate == null) return '';
    return _formatDate(_selectedDate!);
  }

  String _formatDate(DateTime date) {
    // Format: "Tuesday 09/07/2024"
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

  void _pickDate(BuildContext context) async {
    final picked = await showTableCalendarDialog(context);
    // loggerError(picked.toString());
    if (picked != null && picked is DateTime) {
      setState(() {
        _selectedDate = picked;
      });
    }
    loggerError(_selectedDate.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Expiration Date',
          style: AppStyles.secondaryStyle.copyWith(fontSize: 7.sp),
        ),
        verticalSpace(24),
        CustomTextFormField(
          hint: _selectedDate != null ? formattedDate : 'DD/MM/YY',
          readOnly: true,
          onTap: () => _pickDate(context),
          textEditingController: TextEditingController(text: formattedDate),
        ),
      ],
    );
  }
}
