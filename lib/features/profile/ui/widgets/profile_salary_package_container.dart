import 'package:flutter/material.dart';
import 'package:hrmatrix/features/profile/ui/widgets/common_container_profile.dart';
import 'package:hrmatrix/features/profile/ui/widgets/common_divider_profile.dart';
import 'package:hrmatrix/features/profile/ui/widgets/profile_middle_container_item.dart';

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
            jobTitle: '15000 EGP',
          ),

          ProfileMiddleContainerItem(
            header: 'Total Salary',
            jobTitle: '15000 EGP',
          ),
          ProfileMiddleContainerItem(
            header: 'Housing Allowance',
            jobTitle: '0.00 EGP',
          ),
          ProfileMiddleContainerItem(
            header: 'Transportation Allowance',
            jobTitle: '0.00 EGP',
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
