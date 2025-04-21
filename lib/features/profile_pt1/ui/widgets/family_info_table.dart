import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helper/spacing.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/core/theming/app_styles.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/common_container_profile.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/family_info_header_item.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/no_data_available.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/save_as_widget.dart';
import 'package:hrmatrix/main.dart';

import '../../../../core/widgets/custom_search_text_field.dart';

class FamilyInfoTable extends StatelessWidget {
  const FamilyInfoTable({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonContainerProfile(
      child: Column(
        children: [
          CustomSearchTextFeild(readOnly: false),
          verticalSpace(28),
          SaveAsWidget(),
          verticalSpace(28),

          (employeeModel!.familyInfo!.isEmpty)
              ? NoDataAvailable()
              : Table(
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
                  ...employeeModel!.familyInfo!.map((row) {
                    return TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,

                            child: Text(
                              row.name!,
                              style: AppStyles.primaryStyle.copyWith(
                                fontSize: 7.sp,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              row.phoneNumber!,
                              style: AppStyles.primaryStyle.copyWith(
                                fontSize: 7.sp,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,

                            child: Text(
                              row.relation!,
                              style: AppStyles.primaryStyle.copyWith(
                                fontSize: 7.sp,
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
