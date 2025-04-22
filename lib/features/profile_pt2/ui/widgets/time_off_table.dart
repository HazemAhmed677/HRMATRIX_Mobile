import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helpers/employee_model_helpers.dart';

import '../../../../core/theming/app_color.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../profile_pt1/ui/widgets/family_info_header_item.dart';
import '../../data/models/get_my_requests_model/request.dart';

class TimeOffTable extends StatelessWidget {
  const TimeOffTable({super.key, required this.timeOffRequests});
  final List<Request> timeOffRequests;

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
    return buildTextCell(status);
  }

  @override
  Widget build(BuildContext context) {
    return Table(
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
        ...timeOffRequests.map((row) {
          return TableRow(
            children: [
              buildTextCell(row.content!),
              buildTextCell(row.timeOffFromHour!),
              buildTextCell(row.timeOffToHour!),
              buildTextCell(row.timeOff!.toString()),
              buildTextCell(convertTimeStmpToDate(row.timeOffDate!)),
              buildStatusWidget(row.status!),
            ],
          );
        }),
      ],
    );
  }
}
