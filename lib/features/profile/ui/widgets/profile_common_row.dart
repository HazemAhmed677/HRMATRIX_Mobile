import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/features/profile/ui/widgets/save_as_widget.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/app_color.dart';
import '../../../../core/widgets/custom_logout_button.dart';

class ProfileCommonRow extends StatelessWidget {
  const ProfileCommonRow({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SaveAsWidget(),
        horizontalSpace(18),
        CustomActionButton(
          onPressed: () {},
          text: text,
          edgeColor: AppColors.customActionButton,
          backgroundColor: AppColors.customActionButton,
          textColor: AppColors.white,
          overlayColor: AppColors.white,
          size: Size(40.w, 80.h),
          fontSize: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ],
    );
  }
}
