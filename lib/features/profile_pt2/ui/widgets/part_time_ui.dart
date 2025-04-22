import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helpers/spacing.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/core/theming/app_styles.dart';
import 'package:hrmatrix/core/widgets/custom_search_text_field.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/common_container_profile.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/family_info_header_item.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/save_as_widget.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/show_options.dart';
import 'package:hrmatrix/features/profile_pt2/ui/widgets/invalid_access.dart';
import 'package:hrmatrix/main.dart';

class PartTimeUI extends StatelessWidget {
  const PartTimeUI({super.key});

  Widget buildTextCell(String text, {double fontSize = 7.0}) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppStyles.primaryStyle.copyWith(fontSize: fontSize.sp),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return employeeModel!.jobType! == 'Part Time'
        ? Column(
          children: [
            verticalSpace(38),

            CommonContainerProfile(
              child: Column(
                children: [
                  CustomSearchTextFeild(readOnly: false, hintText: 'Search...'),
                  verticalSpace(28),
                  Row(
                    children: [
                      ShowDropDownOptions(onEntriesChanged: (int value) {}),
                      Spacer(),
                      const SaveAsWidget(),
                    ],
                  ),
                  verticalSpace(28),

                  Table(
                    border: TableBorder.all(color: AppColors.grey300, width: 1),
                    columnWidths: const {
                      0: FlexColumnWidth(2),
                      1: FlexColumnWidth(2),
                      2: FlexColumnWidth(2),
                    },
                    children: [
                      TableRow(
                        decoration: BoxDecoration(color: AppColors.grey100),
                        children: const [
                          FamilyInfoHeaderItem(text: 'Working Hours'),
                          FamilyInfoHeaderItem(text: 'Worked Hours'),
                          FamilyInfoHeaderItem(text: 'Remaining Hours'),
                        ],
                      ),
                      TableRow(
                        children: [
                          buildTextCell(
                            employeeModel!.workingHours!.toString(),
                          ),
                          buildTextCell(employeeModel!.workedHours!.toString()),
                          buildTextCell(
                            (employeeModel!.workingHours! -
                                    employeeModel!.workedHours!)
                                .toString(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
        : InvalidAccess();
  }
}
