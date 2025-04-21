import 'package:flutter/material.dart';
import 'package:hrmatrix/core/helper/employee_model_helpers.dart';
import 'package:hrmatrix/features/profile/ui/widgets/common_container_profile.dart';
import 'package:hrmatrix/features/profile/ui/widgets/common_divider_profile.dart';
import 'package:hrmatrix/features/profile/ui/widgets/profile_middle_container_item.dart';
import 'package:hrmatrix/main.dart';

import '../../../../core/theming/app_styles.dart';

class ProfileSalaryPackageContainer extends StatelessWidget {
  const ProfileSalaryPackageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonContainerProfile(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Salary Package', style: AppStyles.primaryStyle),
          CommonDividerProfile(),

          ProfileMiddleContainerItem(
            header: 'Basic Salary',
            jobTitle: '${employeeModel!.salaryDetails!.baseSalary!} EGP',
          ),

          ProfileMiddleContainerItem(
            header: 'Total Salary',
            jobTitle: '${employeeModel!.salaryDetails!.totalSalary!} EGP',
          ),
          ProfileMiddleContainerItem(
            header: 'Housing Allowance',
            jobTitle: '${employeeModel!.salaryDetails!.housingAllowance!} EGP',
          ),
          ProfileMiddleContainerItem(
            header: 'Transportation Allowance',
            jobTitle:
                '${employeeModel!.salaryDetails!.transportationAllowance!} EGP',
          ),

          ProfileMiddleContainerItem(
            header: 'Employment Period',
            jobTitle: calculateEmploymentPeriod(
              employeeModel!.dateOfJoining!,
              employeeModel!.endOfProbation!,
            ),
            isLastELement: true,
          ),
        ],
      ),
    );
  }
}
