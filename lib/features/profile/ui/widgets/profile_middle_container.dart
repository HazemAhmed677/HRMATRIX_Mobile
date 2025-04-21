import 'package:flutter/material.dart';
import 'package:hrmatrix/features/profile/ui/widgets/common_container_profile.dart';
import 'package:hrmatrix/features/profile/ui/widgets/common_divider_profile.dart';
import 'package:hrmatrix/features/profile/ui/widgets/profile_middle_container_item.dart';
import 'package:hrmatrix/main.dart';

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
            jobTitle: 'Planning',
          ),
          ProfileMiddleContainerItem(
            header: 'Hierarchal Manager',
            jobTitle: '-',
          ),
          ProfileMiddleContainerItem(header: 'Branch', jobTitle: 'KSA'),
          ProfileMiddleContainerItem(header: 'Main Project', jobTitle: '-'),
          ProfileMiddleContainerItem(header: 'Job Type', jobTitle: 'Part Time'),
          ProfileMiddleContainerItem(
            header: 'Hiring Date',
            jobTitle: '01/01/2025',
          ),
          ProfileMiddleContainerItem(
            header: 'End of Probation',
            jobTitle: '01/04/2025',
          ),
          ProfileMiddleContainerItem(
            header: 'Employment Period',
            jobTitle: '3 months, 10 days',
            isLastELement: true,
          ),
        ],
      ),
    );
  }
}
