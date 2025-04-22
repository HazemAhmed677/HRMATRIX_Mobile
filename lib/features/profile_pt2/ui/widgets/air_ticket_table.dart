import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helper/employee_model_helpers.dart';
import 'package:hrmatrix/features/profile_pt2/data/models/get_my_air_tickets_model/get_my_air_tickets_model.dart';

import '../../../../core/theming/app_color.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../profile_pt1/ui/widgets/family_info_header_item.dart';

class AirTicketTable extends StatelessWidget {
  const AirTicketTable({super.key, required this.getMyAirTicketsModel});
  final GetMyAirTicketsModel getMyAirTicketsModel;
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

    if (lowerStatus == 'approved' ||
        lowerStatus == 'rejected' ||
        lowerStatus == 'pending') {
      bgColor =
          lowerStatus == 'approved'
              ? Colors.green.withValues(alpha: 0.1)
              : lowerStatus == 'rejected'
              ? Colors.red.withValues(alpha: 0.1)
              : AppColors.orange.withValues(alpha: 0.1);
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
                fontSize: 7.sp,
                color:
                    lowerStatus == 'approved'
                        ? Colors.green
                        : lowerStatus == 'rejected'
                        ? Colors.red
                        : AppColors.orange,
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
    return Table(
      border: TableBorder.all(color: AppColors.grey300, width: 1),
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(1.5),
        2: FlexColumnWidth(2),
        3: FlexColumnWidth(1.5),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: AppColors.grey100),
          children: const [
            FamilyInfoHeaderItem(text: 'Name'),
            FamilyInfoHeaderItem(text: 'Amount'),
            FamilyInfoHeaderItem(text: 'Effective Date'),
            FamilyInfoHeaderItem(text: 'Status'),
          ],
        ),
        ...getMyAirTicketsModel.transactions!.map((row) {
          return TableRow(
            children: [
              buildTextCell(row.name!),
              buildTextCell(row.amount!),
              buildTextCell(convertTimeStmpToDate(row.effectiveDate!)),
              buildStatusWidget(row.status!),
            ],
          );
        }),
      ],
    );
  }
}
