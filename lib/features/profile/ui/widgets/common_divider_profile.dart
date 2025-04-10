import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_color.dart';

class CommonDividerProfile extends StatelessWidget {
  const CommonDividerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.borderColor,
      thickness: 2,
      height: 28.h,
      indent: 0,
      endIndent: 200,
    );
  }
}
