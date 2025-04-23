import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/widgets/custom_logout_button.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_color.dart';

class TableCalendarForDialog extends StatefulWidget {
  const TableCalendarForDialog({super.key, required this.target});
  final BuildContext target;

  @override
  State<TableCalendarForDialog> createState() => _TableCalendarForDialogState();
}

class _TableCalendarForDialogState extends State<TableCalendarForDialog> {
  DateTime _selectedDate = DateTime.now();
  bool _isYearSelectionMode = false;

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDate = selectedDay;
    });
  }

  void _onYearSelected(int year) {
    setState(() {
      _selectedDate = DateTime(year, _selectedDate.month, _selectedDate.day);
      _isYearSelectionMode = false; // Switch back to calendar mode
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      backgroundColor: AppColors.white,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.sp)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 44.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildToggleButton(),
              verticalSpace(6),
              if (_isYearSelectionMode)
                _buildYearPicker()
              else
                _buildCalendar(),
              verticalSpace(14),
              Row(
                children: [
                  Expanded(
                    child: CustomActionButton(
                      text: 'Cancel',
                      onPressed: () {
                        Navigator.pop(context);
                      },

                      edgeColor: AppColors.borderColor,
                      backgroundColor: AppColors.white,
                      textColor: AppColors.fontPrimaryColor,
                      overlayColor: AppColors.fontPrimaryColor,
                      fontSize: 10,
                      size: Size(MediaQuery.sizeOf(context).width, 90.h),
                    ),
                  ),
                  horizontalSpace(12),
                  Expanded(
                    child: CustomActionButton(
                      text: 'Ok',
                      onPressed: () {
                        Navigator.pop(context, _selectedDate);
                      },

                      edgeColor: AppColors.fontPrimaryColor,
                      backgroundColor: AppColors.fontPrimaryColor,
                      textColor: AppColors.white,
                      overlayColor: AppColors.white,
                      fontSize: 10,
                      size: Size(MediaQuery.sizeOf(context).width, 90.h),
                    ),
                  ),
                ],
              ),
              verticalSpace(14),
            ],
          ),
        ),
      ),
    );
  }

  /// Widget to build the toggle button
  Widget _buildToggleButton() {
    return Padding(
      padding: EdgeInsets.only(
        top: 10.h,
        bottom: _isYearSelectionMode ? 10.h : 0,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.fontPrimaryColor,
          foregroundColor: AppColors.white,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.sp),
          ),
          elevation: 5,
        ),
        onPressed: () {
          setState(() {
            _isYearSelectionMode = !_isYearSelectionMode;
          });
        },
        child: Text(
          _isYearSelectionMode ? "Back to Calendar" : "Choose Year",
          style: TextStyle(
            fontSize:
                MediaQuery.orientationOf(context) == Orientation.landscape
                    ? 8.sp
                    : 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return TableCalendar(
      availableCalendarFormats: const {CalendarFormat.month: 'Month'},
      firstDay: DateTime(2022),
      lastDay: DateTime(2030),
      focusedDay: _selectedDate,
      selectedDayPredicate: (day) => isSameDay(day, _selectedDate),
      onDaySelected: _onDaySelected,
      calendarStyle: const CalendarStyle(
        cellMargin: EdgeInsets.all(4.0), // Adds padding between days
      ),
    );
  }

  Widget _buildYearPicker() {
    const startYear = 1940;
    final currentYear = DateTime.now().year;

    return SizedBox(
      height: 300.h,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: currentYear - startYear + 1,
        itemBuilder: (context, index) {
          final year = currentYear - index; // Reverse order
          return GestureDetector(
            onTap: () => _onYearSelected(year),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      year == _selectedDate.year
                          ? AppColors.fontSecondayColor
                          : AppColors.grey200,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12.sp),
                color:
                    year == _selectedDate.year
                        ? AppColors.fontSecondayColor.withOpacity(0.2)
                        : Colors.transparent,
              ),
              alignment: Alignment.center,
              child: Text(
                "$year",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color:
                      year == _selectedDate.year
                          ? AppColors.fontSecondayColor
                          : AppColors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
