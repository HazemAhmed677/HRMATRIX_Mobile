import 'package:flutter/material.dart';
import 'package:hrmatrix/features/profile_pt2/ui/widgets/time_off_table_container.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../profile_pt1/ui/widgets/profile_common_top_container.dart';

class TimeOffUI extends StatelessWidget {
  const TimeOffUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(38),
        const ProfileCommonTopContainer(),
        verticalSpace(38),
        TimeOffTableContainer(),
      ],
    );
  }
}
