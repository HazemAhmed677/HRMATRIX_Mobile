import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helpers/employee_model_helpers.dart';
import 'package:hrmatrix/features/profile_pt2/data/models/get_my_contracts_model/get_my_contracts_model.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_color.dart';
import '../../../../core/widgets/custom_search_text_field.dart';
import '../../../profile_pt1/ui/widgets/common_container_profile.dart';
import '../../../profile_pt1/ui/widgets/save_as_widget.dart';

class ContractsTable extends StatelessWidget {
  const ContractsTable({super.key, required this.getMyContractsModel});
  final GetMyContractsModel getMyContractsModel;
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
                3: FlexColumnWidth(2),
                4: FlexColumnWidth(1.8),
                5: FlexColumnWidth(1.2),
              },
              border: TableBorder.symmetric(
                inside: BorderSide(color: Colors.grey.shade300),
              ),
              children: [
                // Header row
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey.shade200),
                  children: [
                    _buildCell('Contract Name', isHeader: true),
                    _buildCell('Termination Fees', isHeader: true),
                    _buildCell('Start Date', isHeader: true),
                    _buildCell('End Date', isHeader: true),
                    _buildCell('Contract Type', isHeader: true),
                    _buildCell('Attachment', isHeader: true),
                  ],
                ),
                // Data rows
                ...getMyContractsModel.data!.contracts!.map((row) {
                  return TableRow(
                    children: [
                      _buildCell(row.contractname!),
                      _buildCell(row.terminationFees!.toString()),
                      _buildCell(convertTimeStmpToDate(row.startDate!)),
                      _buildCell(convertTimeStmpToDate(row.endDate!)),
                      _buildCell(row.contractType!),
                      _buildAttachmentIcon(attachURL: row.attachment!),
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
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: isHeader ? 7.w : 6.sp,
        ),
      ),
    );
  }

  Widget _buildAttachmentIcon({required String attachURL}) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GestureDetector(
        onTap: () {
          // Handle view file logic here
        },
        child: Icon(
          Icons.insert_drive_file,
          size: 16.sp,
          color: AppColors.blue,
        ),
      ),
    );
  }
}
