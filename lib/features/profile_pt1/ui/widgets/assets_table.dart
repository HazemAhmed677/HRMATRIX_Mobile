import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helper/employee_model_helpers.dart';
import 'package:hrmatrix/features/profile_pt1/data/models/get_my_asset_model/get_my_asset_model.dart';

import '../../../../core/theming/app_color.dart';

class AssetsTable extends StatelessWidget {
  const AssetsTable({super.key, required this.assets});
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
      ),
    );
  }

  Widget _buildDataCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Text(
        text,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 6.sp),
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
        statusColor = Colors.grey.shade700;
    }
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: statusColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          status,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: statusColor, fontSize: 4.sp),
        ),
      ),
    );
  }

  // Helper method for the attachment cell that displays a file icon.
  Widget _buildIconCell() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Icon(Icons.insert_drive_file, color: AppColors.grey, size: 6.sp),
    );
  }

  final List<GetMyAssetModel> assets;
  @override
  Widget build(BuildContext context) {
    return Container(
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
          1: FlexColumnWidth(2.5),
          2: FlexColumnWidth(2),
          3: FlexColumnWidth(1.9),
          4: FlexColumnWidth(2),
          5: FlexColumnWidth(2),
          6: FlexColumnWidth(2),
          7: FlexColumnWidth(1.5),
          8: FlexColumnWidth(1),
        },
        border: TableBorder.symmetric(
          inside: BorderSide(color: AppColors.grey300),
          outside: BorderSide(color: AppColors.grey300),
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
          ...assets.map(
            (asset) => TableRow(
              children: [
                _buildDataCell(asset.name ?? ''),
                _buildDataCell(asset.description ?? ''),
                _buildDataCell(asset.serialNumber ?? ''),
                _buildDataCell(asset.condition ?? ''),
                _buildDataCell(convertTimeStmpToDate(asset.holdingDate!)),
                _buildDataCell(convertTimeStmpToDate(asset.droppingDate!)),
                _buildDataCell(asset.droppingNotified?.toString() ?? ''),
                _buildStatusCell(asset.status ?? ''),
                _buildIconCell(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
