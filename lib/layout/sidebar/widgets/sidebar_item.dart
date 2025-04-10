import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helper/spacing.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/core/theming/app_styles.dart';

class SidebarItem extends StatelessWidget {
  const SidebarItem({
    super.key,
    required this.title,
    required this.iconData,
    required this.onTap,
    required this.isActive,
  });
  final String title;
  final IconData iconData;
  final bool isActive;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.blue,
      child: Padding(
        padding: EdgeInsets.only(bottom: 12.h),
        child: AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: isActive ? AppColors.blue.withValues(alpha: 0.1) : null,
          ),
          duration: Duration(milliseconds: 120),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              children: [
                Icon(
                  iconData,
                  size:
                      MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? 10.sp
                          : 18.sp,
                  color: isActive ? AppColors.blue : AppColors.grey300,
                ),
                horizontalSpace(12),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    title,
                    style: AppStyles.boldSecondaryColor22.copyWith(
                      color:
                          isActive
                              ? AppColors.blue
                              : AppColors.fontPrimaryColor,
                      fontSize:
                          MediaQuery.of(context).orientation ==
                                  Orientation.landscape
                              ? 8.sp
                              : 14.sp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
