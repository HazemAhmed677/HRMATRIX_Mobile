import 'package:flutter/material.dart';
import 'package:hrmatrix/features/profile/ui/widgets/off_time_table.dart';

import '../../../../core/helper/spacing.dart';
import 'profile_common_top_container.dart';

class TimeOffUI extends StatelessWidget {
  const TimeOffUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(38),
        const ProfileCommonTopContainer(),
        verticalSpace(38),
        TimeOffTable(),
      ],
    );
  }
}
