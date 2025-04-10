import 'package:flutter/material.dart';
import 'package:hrmatrix/features/profile/ui/widgets/common_container_profile.dart';
import 'package:hrmatrix/features/profile/ui/widgets/common_divider_profile.dart';

import '../../../../core/theming/app_styles.dart';
import 'profile_middle_container_item.dart';
import 'profile_personal_info_container_item.dart';

class ProfilePersonalInfoContainer extends StatelessWidget {
  const ProfilePersonalInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonContainerProfile(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Personal Information', style: AppStyles.primaryStyle),
          CommonDividerProfile(),

          ProfilePersonalInfoContainerItem(
            header1: 'Gender',
            header2: 'Natinality',
            title1: 'Male',
            title2: 'Egyptian',
          ),
          ProfilePersonalInfoContainerItem(
            header1: 'Birthday',
            header2: 'Email',
            title1: '9/7/2000',
            title2: 'z8MwL@example.com',
          ),
          ProfilePersonalInfoContainerItem(
            header1: 'Age',
            header2: 'Marital Status',
            title1: '19',
            title2: 'Married',
          ),
          ProfilePersonalInfoContainerItem(
            header1: 'National ID',
            header2: 'Citizen',
            title1: '30203044827522',
            title2: 'Cairo',
          ),
          ProfilePersonalInfoContainerItem(
            header1: 'Phone Number',
            header2: 'Secondary one',
            title1: '01276933241',
            title2: '-',
          ),

          ProfileMiddleContainerItem(
            header: 'Address',
            jobTitle: 'Cairo - ALmo1atam 9th street',
            isLastELement: true,
          ),
        ],
      ),
    );
  }
}
