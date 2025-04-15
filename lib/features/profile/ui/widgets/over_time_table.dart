import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/features/profile/ui/widgets/common_container_profile.dart';
import 'package:hrmatrix/features/profile/ui/widgets/helpers/profile_common_dialog.dart';
import 'package:hrmatrix/features/profile/ui/widgets/over_time_dialog_widget.dart';
import 'package:hrmatrix/features/profile/ui/widgets/profile_common_row.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/widgets/custom_search_text_field.dart';

class OverTimeTable extends StatelessWidget {
  const OverTimeTable({super.key});
  final List<Map<String, String>> dummyData = const [
    {
      'content': 'Project A',
      'overtime': '2 hours',
      'overtimeDate': '24/08/2023',
      'startTime': '10:00 AM',
      'endTime': '12:00 PM',
      'status': 'Approved',
    },
    {
      'content': 'Maintenance',
      'overtime': '1.5 hours',
      'overtimeDate': '25/08/2023',
      'startTime': '11:00 AM',
      'endTime': '12:30 PM',
      'status': 'Pending',
    },
    {
      'content': 'IT Support',
      'overtime': '3 hours',
      'overtimeDate': '26/08/2023',
      'startTime': '09:00 AM',
      'endTime': '12:00 PM',
      'status': 'Rejected',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CommonContainerProfile(
      child: Column(
        children: [
          CustomSearchTextFeild(readOnly: false, hintText: 'Search...'),
          verticalSpace(28),
          if (MediaQuery.of(context).orientation == Orientation.landscape)
            ProfileCommonRow(
              text: 'Request Overtime',
              onPressed: () {
                showProfileCommonDialog(
                  child: OverTimeDialogWidget(),
                  context: context,
                );
              },
            ),
          verticalSpace(28),
          // Table Widget
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(1.5),
                2: FlexColumnWidth(2),
                3: FlexColumnWidth(1.5),
                4: FlexColumnWidth(1.5),
                5: FlexColumnWidth(1.5),
              },
              border: TableBorder.symmetric(
                inside: BorderSide(color: Colors.grey.shade300),
              ),
              children: [
                // Header row
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey.shade200),
                  children: [
                    _buildCell('Content', isHeader: true),
                    _buildCell('Over Time', isHeader: true),
                    _buildCell('Over Time Date', isHeader: true),
                    _buildCell('Start Time', isHeader: true),
                    _buildCell('End Time', isHeader: true),
                    _buildCell('Status', isHeader: true),
                  ],
                ),
                // Data rows (dummy)
                ...dummyData.map((row) {
                  return TableRow(
                    children: [
                      _buildCell(row['content']!),
                      _buildCell(row['overtime']!),
                      _buildCell(row['overtimeDate']!),
                      _buildCell(row['startTime']!),
                      _buildCell(row['endTime']!),
                      _buildStatusCell(row['status']!),
                    ],
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build a normal cell widget
  Widget _buildCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: isHeader ? 7.w : 6.sp,
        ),
      ),
    );
  }

  // Helper method for status cell with color coding
  Widget _buildStatusCell(String status) {
    Color statusColor;
    switch (status.toLowerCase()) {
      case 'approved':
        statusColor = Colors.green;
        break;
      case 'pending':
        statusColor = Colors.orange;
        break;
      case 'rejected':
        statusColor = Colors.red;
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
        child: Text(
          status,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: statusColor, fontSize: 6.sp),
        ),
      ),
    );
  }
}
