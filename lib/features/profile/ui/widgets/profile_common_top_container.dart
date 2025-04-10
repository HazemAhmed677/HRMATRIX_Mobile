import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/features/profile/ui/widgets/common_container_profile.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/typography/app_images.dart';

class ProfileCommonTopContainer extends StatelessWidget {
  const ProfileCommonTopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonContainerProfile(
      child: Column(
        children: [
          CircleAvatar(
            radius:
                MediaQuery.of(context).orientation == Orientation.landscape
                    ? 74.r
                    : 32.r,
            backgroundImage: AssetImage(AppImages.profile),
          ),
          verticalSpace(22),
          Text('Hazem Ahmed', style: AppStyles.primaryStyle),
          verticalSpace(8),
          Text('120', style: AppStyles.secondaryStyle),
          verticalSpace(8),
          Text('Member', style: AppStyles.secondaryStyle),
        ],
      ),
    );
  }
}
