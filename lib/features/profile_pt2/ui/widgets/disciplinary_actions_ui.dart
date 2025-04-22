import 'package:flutter/material.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/profile_common_top_container.dart'
    show ProfileCommonTopContainer;
import 'package:hrmatrix/features/profile_pt2/ui/widgets/disciplinary_actions_table.dart';

import '../../../../core/helpers/spacing.dart';

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
