import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helper/spacing.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/core/theming/app_styles.dart';
import 'package:hrmatrix/core/widgets/custom_search_text_field.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/common_container_profile.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/family_info_header_item.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/helpers/profile_common_dialog.dart';
import 'package:hrmatrix/features/profile_pt2/ui/widgets/air_tickets_request_dialog.dart';

import '../../../profile_pt1/ui/widgets/profile_common_row.dart';

class AirTicketsTable extends StatelessWidget {
  const AirTicketsTable({super.key});

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

    if (lowerStatus == 'approved' ||
        lowerStatus == 'rejected' ||
        lowerStatus == 'pending') {
      bgColor =
          lowerStatus == 'approved'
              ? Colors.green.withOpacity(0.1)
              : lowerStatus == 'rejected'
              ? Colors.red.withOpacity(0.1)
              : AppColors.orange.withOpacity(0.1);
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
    final List<Map<String, String>> data = [
      {
        'Name': 'Ticket A',
        'Amount': '1000',
        'EffectiveDate': '01/01/2023',
        'Status': 'Approved',
      },
      {
        'Name': 'Ticket B',
        'Amount': '90',
        'EffectiveDate': '15/02/2023',
        'Status': 'Rejected',
      },
      {
        'Name': 'Ticket C',
        'Amount': '120',
        'EffectiveDate': '20/03/2023',
        'Status': 'Pending',
      },
      {
        'Name': 'Ticket D',
        'Amount': '819',
        'EffectiveDate': '05/04/2023',
        'Status': 'Approved',
      },
    ];

    return CommonContainerProfile(
      child: Column(
        children: [
          CustomSearchTextFeild(
            readOnly: false,
            hintText: 'Search air tickets...',
          ),
          verticalSpace(28),
          ProfileCommonRow(
            text: 'Request Air Ticket',
            onPressed: () {
              showProfileCommonDialog(
                child: AirTicketsRequestDialog(),
                context: context,
              );
            },
          ),
          verticalSpace(28),
          Table(
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
              ...data.map((row) {
                return TableRow(
                  children: [
                    buildTextCell(row['Name']!),
                    buildTextCell(row['Amount']!),
                    buildTextCell(row['EffectiveDate']!),
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
