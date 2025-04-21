import 'package:flutter/material.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/profile_middle_container.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/profile_salary_package_container.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/profile_top_container.dart';

import '../../../../core/helper/spacing.dart';
import 'profile_personal_info_container.dart';

class ProfileUI extends StatelessWidget {
  const ProfileUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfileTopContainer(),
        verticalSpace(18),
        ProfileMiddleContainer(),
        verticalSpace(18),
        ProfilePersonalInfoContainer(),
        verticalSpace(18),
        ProfileSalaryPackageContainer(),
      ],
    );
  }
}
