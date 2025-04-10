import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helper/spacing.dart';
import 'package:hrmatrix/core/typography/app_images.dart';
import 'package:hrmatrix/features/profile/ui/widgets/common_container_profile.dart';

import '../../../../core/theming/app_styles.dart';

class BankAccountTopContainer extends StatelessWidget {
  const BankAccountTopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonContainerProfile(
      child: Column(
        children: [
          CircleAvatar(
            radius: 32.r,
            backgroundImage: AssetImage(AppImages.profile),
          ),
          verticalSpace(22),
          Text('Hazem Ahmed', style: AppStyles.primaryStyle),
          verticalSpace(8),
          Text('120', style: AppStyles.secondaryStyle),
          verticalSpace(4),
          Text('Member', style: AppStyles.secondaryStyle),
        ],
      ),
    );
  }
}
