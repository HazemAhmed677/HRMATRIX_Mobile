import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_color.dart';

class CloseWidget extends StatelessWidget {
  const CloseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 18.r,
      backgroundColor: AppColors.grey200,
      child: Icon(Icons.close, color: AppColors.black, size: 18.sp),
    );
  }
}
