import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/core/typography/font_weight_helper.dart';
import 'package:hrmatrix/core/widgets/custom_logout_button.dart';
import 'package:hrmatrix/features/profile/ui/widgets/common_container_profile.dart';
import 'package:hrmatrix/features/profile/ui/widgets/helpers/profile_common_dialog.dart';
import 'package:hrmatrix/features/profile/ui/widgets/profile_edit_dialog_widget.dart';
import 'package:hrmatrix/features/profile/ui/widgets/profile_reset_button_dialog_widget.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/typography/app_images.dart';

class ProfileTopContainer extends StatelessWidget {
  const ProfileTopContainer({super.key});

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
          Text('ID: 5', style: AppStyles.secondaryStyle),
          verticalSpace(12),
          CustomActionButton(
            onPressed: () {
              showProfileCommonDialog(
                child: ProfileResetButtonDialogWidget(),
                context: context,
              );
            },
            text: 'Reset Password',
            edgeColor: AppColors.orange.withValues(alpha: 0.6),
            backgroundColor: AppColors.white,
            textColor: AppColors.black,
            overlayColor: AppColors.orange.withValues(alpha: 0.4),
            size: Size(MediaQuery.sizeOf(context).width, 52.h),
            fontWeight: FontWeightHelper.bold,
            fontSize: 14,
          ),
          verticalSpace(22),
          CustomActionButton(
            onPressed: () {
              showProfileCommonDialog(
                child: ProfileEditDialogWidget(),
                context: context,
              );
            },
            text: 'Edit',
            edgeColor: AppColors.grey300,
            backgroundColor: AppColors.white,
            textColor: AppColors.black,
            overlayColor: AppColors.grey500,
            size: Size(MediaQuery.sizeOf(context).width, 52.h),
            fontWeight: FontWeightHelper.bold,
            fontSize: 14,
          ),
        ],
      ),
    );
  }
}
