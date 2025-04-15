import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/theming/app_color.dart';

class ProfileCommonDialogWidget extends StatelessWidget {
  const ProfileCommonDialogWidget({
    super.key,
    required this.child,
    required this.context,
  });
  final Widget child;
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal:
              MediaQuery.orientationOf(context) == Orientation.landscape
                  ? 16.w
                  : 22.w,
          vertical:
              MediaQuery.orientationOf(context) == Orientation.landscape
                  ? 40.0.h
                  : 28.0.h,
        ),
        child: child,
      ),
    );
  }
}
