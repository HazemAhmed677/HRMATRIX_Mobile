import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/theming/app_color.dart';

import '../profile_common_dialog_widget.dart';

void profileCommonDialog({
  required Widget child,
  required BuildContext context,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: AppColors.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: ProfileCommonDialogWidget(context: context, child: child),
      );
    },
  );
}
