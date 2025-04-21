import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helper/spacing.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/core/widgets/custom_search_text_field.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/common_container_profile.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/save_as_widget.dart';

class DisciplinaryActionsTable extends StatelessWidget {
  const DisciplinaryActionsTable({super.key});

  final List<Map<String, String>> dummyData = const [
    {
      'rule': 'Hshshsh',
      'amount': '10',
      'type': 'Salary Deduction',
      'duration': '1',
      'attachment': 'View',
    },
    {
      'rule': 'Late Arrival',
      'amount': '5',
      'type': 'Salary Deduction',
      'duration': '2',
      'attachment': 'View',
    },
    {
      'rule': 'Absent Without Notice',
      'amount': '20',
      'type': 'Salary Deduction',
      'duration': '3',
      'attachment': 'View',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CommonContainerProfile(
      child: Column(
        children: [
          CustomSearchTextFeild(readOnly: false, hintText: 'Search...'),
          verticalSpace(28),
          const SaveAsWidget(),
          verticalSpace(28),
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
              },
              border: TableBorder.symmetric(
                inside: BorderSide(color: Colors.grey.shade300),
              ),
              children: [
                // Header row
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey.shade200),
                  children: [
                    _buildCell('Disciplinary Action Rule', isHeader: true),
                    _buildCell('Disciplinary Action Amount', isHeader: true),
                    _buildCell('Deduction Type', isHeader: true),
                    _buildCell('Deduction Duration', isHeader: true),
                    _buildCell('Attachment', isHeader: true),
                  ],
                ),
                // Data rows
                ...dummyData.map((row) {
                  return TableRow(
                    children: [
                      _buildCell(row['rule']!),
                      _buildCell(row['amount']!),
                      _buildCell(row['type']!),
                      _buildCell(row['duration']!),
                      _buildAttachmentCell(row['attachment']!),
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

  Widget _buildCell(String text, {bool isHeader = false}) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        text,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: isHeader ? 7.w : 6.sp,
        ),
      ),
    );
  }

  Widget _buildAttachmentCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GestureDetector(
        onTap: () {
          // Handle view logic here
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: 6.sp,
            color: AppColors.blue,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.blue,
          ),
        ),
      ),
    );
  }
}
