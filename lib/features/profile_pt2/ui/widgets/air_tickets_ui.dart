import 'package:flutter/material.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/profile_common_top_container.dart';
import 'package:hrmatrix/features/profile_pt2/ui/widgets/air_tickets_table_container.dart';

import '../../../../core/helpers/spacing.dart';

class AirTicketsUI extends StatelessWidget {
  const AirTicketsUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(38),

        const ProfileCommonTopContainer(),
        verticalSpace(38),
        AirTicketsTableContainer(),
      ],
    );
  }
}
