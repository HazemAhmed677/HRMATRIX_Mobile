import 'package:flutter/material.dart';
import 'package:hrmatrix/features/profile/ui/widgets/disciplinary_actions_table.dart';
import 'package:hrmatrix/features/profile/ui/widgets/profile_common_top_container.dart'
    show ProfileCommonTopContainer;

import '../../../../core/helper/spacing.dart';

class DisciplinaryActionsUI extends StatelessWidget {
  const DisciplinaryActionsUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(38),
        const ProfileCommonTopContainer(),
        verticalSpace(38),
        DisciplinaryActionsTable(),
      ],
    );
  }
}
