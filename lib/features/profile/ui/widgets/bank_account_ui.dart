import 'package:flutter/material.dart';
import 'package:hrmatrix/features/profile/ui/widgets/bank_account_second_container.dart';
import 'package:hrmatrix/features/profile/ui/widgets/profile_common_top_container.dart';

import '../../../../core/helper/spacing.dart';

class BankAccountUI extends StatelessWidget {
  const BankAccountUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfileCommonTopContainer(),
        verticalSpace(18),
        BankAccountSecondContainer(),
      ],
    );
  }
}
