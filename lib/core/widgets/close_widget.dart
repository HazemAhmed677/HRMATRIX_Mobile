import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_color.dart';

class CloseWidget extends StatelessWidget {
  const CloseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: () {
        Navigator.pop(context);
      },
      child: CircleAvatar(
        radius:
            MediaQuery.orientationOf(context) == Orientation.landscape
                ? 28.r
                : 18.r,
        backgroundColor: AppColors.grey100,
        child: Icon(
          Icons.close,
          color: AppColors.black,
          size:
              MediaQuery.orientationOf(context) == Orientation.landscape
                  ? 9.sp
                  : 18.sp,
        ),
      ),
    );
  }
}
