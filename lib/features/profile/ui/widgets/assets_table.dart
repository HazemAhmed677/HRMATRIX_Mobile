import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/features/profile/ui/widgets/common_container_profile.dart';
import 'package:hrmatrix/features/profile/ui/widgets/profile_common_row.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/widgets/custom_search_text_field.dart';

class AssetsTable extends StatelessWidget {
  const AssetsTable({super.key});

  // Helper method to build header cell widgets.
  Widget _buildHeaderCell(String title) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 7.sp,
          color: AppColors.fontPrimaryColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  // Helper method to build regular data cells.
  Widget _buildDataCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 6.sp),
        ),
      ),
    );
  }

  // Helper method for status cell that applies color styling.
  Widget _buildStatusCell(String status) {
    Color statusColor;
    switch (status.toLowerCase()) {
      case 'active':
        statusColor = Colors.green;
        break;
      case 'retired':
        statusColor = Colors.orange;
        break;
      default:
        statusColor = Colors.grey;
    }
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: statusColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(6),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            status,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: statusColor, fontSize: 6.sp),
          ),
        ),
      ),
    );
  }

  // Helper method for the attachment cell that displays a file icon.
  Widget _buildIconCell() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Icon(
        Icons.insert_drive_file,
        color: AppColors.customActionButton,
        size: 6.sp,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonContainerProfile(
      child: Column(
        children: [
          CustomSearchTextFeild(readOnly: false, hintText: 'Search...'),
          verticalSpace(28),
          ProfileCommonRow(text: 'Request Asset', onPressed: () {}),
          verticalSpace(28),
          // Table Widget
          Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              // Adjust flex values as needed to fit the design.
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(3),
                2: FlexColumnWidth(2),
                3: FlexColumnWidth(1.5),
                4: FlexColumnWidth(2),
                5: FlexColumnWidth(2),
                6: FlexColumnWidth(2),
                7: FlexColumnWidth(1.5),
                8: FlexColumnWidth(1),
              },
              border: TableBorder.symmetric(
                inside: BorderSide(color: AppColors.grey400),
                outside: BorderSide(color: AppColors.grey400),
              ),
              children: [
                // Header Row
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey.shade200),
                  children: [
                    _buildHeaderCell('Name'),
                    _buildHeaderCell('Description'),
                    _buildHeaderCell('Serial Number'),
                    _buildHeaderCell('Condition'),
                    _buildHeaderCell('Holding Date'),
                    _buildHeaderCell('Dropping Date'),
                    _buildHeaderCell('Dropping Notified'),
                    _buildHeaderCell('Status'),
                    _buildHeaderCell('Attachment'),
                  ],
                ),
                TableRow(
                  children: [
                    _buildDataCell('Laptop'),
                    _buildDataCell('Dell XPS 13'),
                    _buildDataCell('SN12345'),
                    _buildDataCell('Good'),
                    _buildDataCell('01/01/2022'),
                    _buildDataCell('01/02/2023'),
                    _buildDataCell('Yes'),
                    _buildStatusCell('Active'),
                    _buildIconCell(),
                  ],
                ),
                TableRow(
                  children: [
                    _buildDataCell('Phone'),
                    _buildDataCell('iPhone 12 Pro'),
                    _buildDataCell('SN67890'),
                    _buildDataCell('Excellent'),
                    _buildDataCell('05/03/2021'),
                    _buildDataCell('-'),
                    _buildDataCell('No'),
                    _buildStatusCell('Retired'),
                    _buildIconCell(),
                  ],
                ),
                TableRow(
                  children: [
                    _buildDataCell('Tablet'),
                    _buildDataCell('Samsung Galaxy Tab'),
                    _buildDataCell('SN11223'),
                    _buildDataCell('Fair'),
                    _buildDataCell('15/07/2020'),
                    _buildDataCell('15/07/2022'),
                    _buildDataCell('Yes'),
                    _buildStatusCell('Active'),
                    _buildIconCell(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
