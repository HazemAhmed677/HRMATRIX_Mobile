import 'package:flutter/material.dart';
import 'package:hrmatrix/features/profile/ui/widgets/common_container_profile.dart';
import 'package:hrmatrix/features/profile/ui/widgets/common_divider_profile.dart';
import 'package:hrmatrix/features/profile/ui/widgets/profile_middle_container_item.dart';

import '../../../../core/theming/app_styles.dart';

class BankAccountSecondContainer extends StatelessWidget {
  const BankAccountSecondContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonContainerProfile(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Bank Account Status', style: AppStyles.primaryStyle),
          CommonDividerProfile(),

          ProfileMiddleContainerItem(
            header: 'Account Number',
            jobTitle: '65093501849114',
          ),

          ProfileMiddleContainerItem(
            header: 'Status',
            jobTitle: 'Active',
            isLastELement: true,
          ),
        ],
      ),
    );
  }
}
