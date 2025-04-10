import 'package:flutter/material.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/features/profile/ui/widgets/common_container_profile.dart';
import 'package:hrmatrix/features/profile/ui/widgets/profile_common_row.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/widgets/custom_search_text_field.dart';

class DocumentsTable extends StatelessWidget {
  const DocumentsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonContainerProfile(
      child: Column(
        children: [
          CustomSearchTextFeild(
            readOnly: false,
            hintText: 'Search documents...',
          ),
          verticalSpace(28),
          ProfileCommonRow(text: 'Add Document'),
          verticalSpace(28),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(3),
                2: FlexColumnWidth(2),
                3: FlexColumnWidth(1.5),
                4: FlexColumnWidth(1.2),
              },
              border: TableBorder.symmetric(
                inside: BorderSide(color: Colors.grey.shade300),
              ),
              children: [
                // Header
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey.shade200),
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        'Title',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        'Description',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        'Expire Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        'Status',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        'Preview',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),

                // Dummy row 1
                TableRow(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(12),
                      child: Text('Passport'),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12),
                      child: Text('Employee passport copy'),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12),
                      child: Text('12/08/2025'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'Valid',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12),
                      child: Icon(
                        Icons.insert_drive_file,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),

                // Dummy row 2
                TableRow(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(12),
                      child: Text('ID Card'),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12),
                      child: Text('National ID front and back'),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12),
                      child: Text('30/06/2024'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'Expired',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12),
                      child: Icon(
                        Icons.insert_drive_file,
                        color: Colors.blueAccent,
                      ),
                    ),
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
