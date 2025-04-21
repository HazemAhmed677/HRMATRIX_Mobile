import 'package:flutter/material.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/common_container_profile.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/common_divider_profile.dart';
import 'package:hrmatrix/main.dart';

import '../../../../core/helper/employee_model_helpers.dart';
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
            title1: employeeModel!.gender!,
            title2: employeeModel!.nationality!,
          ),
          ProfilePersonalInfoContainerItem(
            header1: 'Birthday',
            header2: 'Email',
            title1: formatBirthDate(employeeModel!.birthDate!),
            title2: employeeModel!.email!,
          ),
          ProfilePersonalInfoContainerItem(
            header1: 'Age',
            header2: 'Marital Status',
            title1: calculateAge(employeeModel!.birthDate!).toString(),
            title2: employeeModel!.maritalStatus!,
          ),
          ProfilePersonalInfoContainerItem(
            header1: 'National ID',
            header2: 'Citizen',
            title1: employeeModel!.nationalId!,
            title2: employeeModel!.citizen!,
          ),
          ProfilePersonalInfoContainerItem(
            header1: 'Phone Number',
            header2: 'Secondary one',
            title1: employeeModel!.phoneNumber!,
            title2: employeeModel!.secondaryPhoneNumber ?? '-',
          ),

          ProfileMiddleContainerItem(
            header: 'Address',
            jobTitle: employeeModel!.address!,
            isLastELement: true,
          ),
        ],
      ),
    );
  }
}
