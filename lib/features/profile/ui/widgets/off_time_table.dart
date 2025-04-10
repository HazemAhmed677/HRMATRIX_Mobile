import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helper/spacing.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/core/theming/app_styles.dart';
import 'package:hrmatrix/core/widgets/custom_search_text_field.dart';
import 'package:hrmatrix/features/profile/ui/widgets/common_container_profile.dart';
import 'package:hrmatrix/features/profile/ui/widgets/family_info_header_item.dart';
import 'package:hrmatrix/features/profile/ui/widgets/profile_common_row.dart';

class TimeOffTable extends StatelessWidget {
  const TimeOffTable({super.key});

  /// Builds a cell containing text with common styling.
  Widget buildTextCell(String text, {double fontSize = 7.0}) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.primaryStyle.copyWith(fontSize: fontSize.sp),
        ),
      ),
    );
  }

  /// Builds the status widget with specific background color based on status.
  Widget buildStatusWidget(String status) {
    final String lowerStatus = status.toLowerCase();
    Color? bgColor;
    String displayText = status;

    if (lowerStatus == 'approved') {
      bgColor = Colors.green;
    } else if (lowerStatus == 'rejected') {
      bgColor = Colors.red;
    }

    if (bgColor != null) {
      return Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(
              displayText,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.primaryStyle.copyWith(
                fontSize: 8.sp,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    }
    // For any status that is not approved or rejected.
    return buildTextCell(status);
  }

  @override
  Widget build(BuildContext context) {
    // Dummy data for off time
    final List<Map<String, String>> data = [
      {
        'Content': 'Meeting',
        'From Hour': '09:00 AM',
        'To Hour': '10:00 AM',
        'Time Off': '1 hr',
        'Time Off Date': '15/08/2023',
        'Status': 'Approved',
      },
      {
        'Content': 'Lunch Break',
        'From Hour': '12:00 PM',
        'To Hour': '13:00 PM',
        'Time Off': '1 hr',
        'Time Off Date': '15/08/2023',
        'Status': 'Pending',
      },
      {
        'Content': 'Doctor Appointment',
        'From Hour': '14:30 PM',
        'To Hour': '15:30 PM',
        'Time Off': '1 hr',
        'Time Off Date': '16/08/2023',
        'Status': 'Rejected',
      },
      {
        'Content': 'Training',
        'From Hour': '10:00 AM',
        'To Hour': '12:00 PM',
        'Time Off': '2 hrs',
        'Time Off Date': '17/08/2023',
        'Status': 'Approved',
      },
    ];

    return CommonContainerProfile(
      child: Column(
        children: [
          // Search Bar
          CustomSearchTextFeild(readOnly: false, hintText: 'Search...'),
          verticalSpace(28),
          // Row with common actions (like add request)
          ProfileCommonRow(text: 'Add Time Off Request'),
          verticalSpace(28),

          // Table Widget with the new columns
          Table(
            border: TableBorder.all(color: AppColors.grey300, width: 1),
            columnWidths: const {
              0: FlexColumnWidth(2),
              1: FlexColumnWidth(1.5),
              2: FlexColumnWidth(1.5),
              3: FlexColumnWidth(1.5),
              4: FlexColumnWidth(2),
              5: FlexColumnWidth(1.5),
            },
            children: [
              // Header Row
              TableRow(
                decoration: BoxDecoration(color: AppColors.grey100),
                children: const [
                  FamilyInfoHeaderItem(text: 'Content'),
                  FamilyInfoHeaderItem(text: 'From Hour'),
                  FamilyInfoHeaderItem(text: 'To Hour'),
                  FamilyInfoHeaderItem(text: 'Time Off'),
                  FamilyInfoHeaderItem(text: 'Time Off Date'),
                  FamilyInfoHeaderItem(text: 'Status'),
                ],
              ),
              // Data Rows
              ...data.map((row) {
                return TableRow(
                  children: [
                    buildTextCell(row['Content']!),
                    buildTextCell(row['From Hour']!),
                    buildTextCell(row['To Hour']!),
                    buildTextCell(row['Time Off']!),
                    buildTextCell(row['Time Off Date']!),
                    buildStatusWidget(row['Status']!),
                  ],
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
