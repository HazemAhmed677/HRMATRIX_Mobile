import 'package:flutter/material.dart';
import 'package:hrmatrix/features/profile/ui/widgets/family_info_table.dart';
import 'package:hrmatrix/features/profile/ui/widgets/profile_common_top_container.dart';

import '../../../../core/helper/spacing.dart';

class FamilyInfoUI extends StatelessWidget {
  const FamilyInfoUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfileCommonTopContainer(),
        verticalSpace(18),
        FamilyInfoTable(),
      ],
    );
  }
}
