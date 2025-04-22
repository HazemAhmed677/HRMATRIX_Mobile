import 'package:flutter/material.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/family_info_table.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/profile_common_top_container.dart';

import '../../../../core/helpers/spacing.dart';

class FamilyInfoUI extends StatelessWidget {
  const FamilyInfoUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(38),

        const ProfileCommonTopContainer(),
        verticalSpace(38),
        FamilyInfoTable(),
      ],
    );
  }
}
