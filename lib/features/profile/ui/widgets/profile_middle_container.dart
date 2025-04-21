import 'package:flutter/material.dart';
import 'package:hrmatrix/features/profile/ui/widgets/common_container_profile.dart';
import 'package:hrmatrix/features/profile/ui/widgets/common_divider_profile.dart';
import 'package:hrmatrix/features/profile/ui/widgets/profile_middle_container_item.dart';
import 'package:hrmatrix/main.dart';

import '../../../../core/helper/employee_model_helpers.dart';
import '../../../../core/theming/app_styles.dart';

class ProfileMiddleContainer extends StatelessWidget {
  const ProfileMiddleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonContainerProfile(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Professional Information', style: AppStyles.primaryStyle),
          CommonDividerProfile(),

          ProfileMiddleContainerItem(
            header: 'Job Title',
            jobTitle: employeeModel!.jobTitle!,
          ),

          ProfileMiddleContainerItem(
            header: 'Role',
            jobTitle: employeeModel!.role!,
          ),
          ProfileMiddleContainerItem(
            header: 'Department',
            jobTitle: employeeModel!.department!.name!,
          ),
          ProfileMiddleContainerItem(
            header: 'Hierarchal Manager',

            // temp
            jobTitle: employeeModel!.directManager?['name'] ?? "-",
          ),
          ProfileMiddleContainerItem(
            header: 'Branch',
            jobTitle: employeeModel!.branch!,
          ),
          // temp
          ProfileMiddleContainerItem(
            header: 'Main Project',
            jobTitle: employeeModel!.employeeMainProjects?[0]['name'] ?? '-',
          ),
          ProfileMiddleContainerItem(
            header: 'Job Type',
            jobTitle: employeeModel!.jobType!,
          ),
          ProfileMiddleContainerItem(
            header: 'Hiring Date',
            jobTitle: convertTimeStmpToDate(employeeModel!.dateOfJoining!),
          ),
          ProfileMiddleContainerItem(
            header: 'End of Probation',
            jobTitle: convertTimeStmpToDate(employeeModel!.endOfProbation!),
          ),
          ProfileMiddleContainerItem(
            header: 'Employment Period',
            // here
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
