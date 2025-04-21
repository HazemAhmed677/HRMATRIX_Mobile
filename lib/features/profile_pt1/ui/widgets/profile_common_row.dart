import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/save_as_widget.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/app_color.dart';
import '../../../../core/widgets/custom_logout_button.dart';
import 'show_options.dart';

class ProfileCommonRow extends StatelessWidget {
  const ProfileCommonRow({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShowDropDownOptions(onEntriesChanged: (int value) {}),
        Spacer(),
        const SaveAsWidget(),
        horizontalSpace(12),
        CustomActionButton(
          onPressed: onPressed,
          text: text,
          edgeColor: AppColors.customActionButton,
          backgroundColor: AppColors.customActionButton,
          textColor: AppColors.white,
          overlayColor: AppColors.white,
          size: Size(40.w, 80.h),
          fontSize: 3.sp,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ],
    );
  }
}
