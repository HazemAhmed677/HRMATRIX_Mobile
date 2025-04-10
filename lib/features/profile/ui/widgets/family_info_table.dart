import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helper/spacing.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/core/theming/app_styles.dart';
import 'package:hrmatrix/features/profile/ui/widgets/common_container_profile.dart';
import 'package:hrmatrix/features/profile/ui/widgets/family_info_header_item.dart';
import 'package:hrmatrix/features/profile/ui/widgets/family_info_save_as.dart';

import '../../../../core/widgets/custom_search_text_field.dart';

class FamilyInfoTable extends StatelessWidget {
  const FamilyInfoTable({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> data = [
      {'Name': 'Mariam Loay', 'Phone': '+201097856989', 'Relation': 'Mother'},
      {'Name': 'Ahmed Zaki', 'Phone': '+201114569874', 'Relation': 'Father'},
      {'Name': 'Sara Mohamed', 'Phone': '+201223345678', 'Relation': 'Sister'},
      {'Name': 'Khaled Nour', 'Phone': '+201345987654', 'Relation': 'Brother'},
      {'Name': 'Laila Samir', 'Phone': '+201009876543', 'Relation': 'Wife'},
      {'Name': 'Ahmed Zaki', 'Phone': '+201114569874', 'Relation': 'Father'},
      {'Name': 'Ahmed Zaki', 'Phone': '+201114569874', 'Relation': 'Father'},
      {'Name': 'Ahmed Zaki', 'Phone': '+201114569874', 'Relation': 'Father'},
    ];

    return CommonContainerProfile(
      child: Column(
        children: [
          CustomSearchTextFeild(readOnly: false),
          verticalSpace(18),
          FamilyInfoSaveAs(),
          verticalSpace(18),

          Table(
            border: TableBorder.all(color: AppColors.grey300, width: 1),
            columnWidths: const {
              0: FlexColumnWidth(2),
              1: FlexColumnWidth(2.5),
              2: FlexColumnWidth(1.5),
            },
            children: [
              TableRow(
                decoration: BoxDecoration(color: AppColors.grey100),
                children: [
                  FamilyInfoHeaderItem(text: 'Name'),
                  FamilyInfoHeaderItem(text: 'Phone Number'),
                  FamilyInfoHeaderItem(text: 'Relation'),
                ],
              ),
              // Data Rows
              ...data.map((row) {
                return TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,

                        child: Text(
                          row['Name']!,
                          style: AppStyles.primaryStyle.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          row['Phone']!,
                          style: AppStyles.primaryStyle.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,

                        child: Text(
                          row['Relation']!,
                          style: AppStyles.primaryStyle.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
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
