import 'package:flutter/material.dart';
import 'package:hrmatrix/features/profile/ui/widgets/contracts_table.dart';
import 'package:hrmatrix/features/profile/ui/widgets/profile_common_top_container.dart';

import '../../../../core/helper/spacing.dart';

class ContractsUI extends StatelessWidget {
  const ContractsUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(38),
        const ProfileCommonTopContainer(),
        verticalSpace(38),
        ContractsTable(),
      ],
    );
  }
}
