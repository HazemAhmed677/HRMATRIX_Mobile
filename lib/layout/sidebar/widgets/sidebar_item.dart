import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helpers/spacing.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/core/theming/app_styles.dart';

class SidebarItem extends StatelessWidget {
  const SidebarItem({
    super.key,
    required this.title,
    required this.iconData,
    required this.onTap,
    required this.isActive,
    this.indent = 0,
    this.isExpandable = false,
    this.isExpanded = false,
  });

  final String title;
  final IconData iconData;
  final bool isActive;
  final Function() onTap;
  final int indent;
  final bool isExpandable;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    bool isLandacape =
        MediaQuery.orientationOf(context) == Orientation.landscape;
    return InkWell(
      onTap: onTap,
      splashColor: Colors.blue,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: isActive ? AppColors.blue.withValues(alpha: 0.1) : null,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: 6.h,
            left: (16 + indent * 12).w,
            right: 16.w,
            top: 6.h,
          ),
          child: Row(
            children: [
              Icon(
                iconData,
                size: isLandacape ? 8.sp : 18.sp,
                color: isActive ? AppColors.blue : AppColors.grey300,
              ),
              horizontalSpace(12),
              Expanded(
                child: Text(
                  title,
                  style: AppStyles.boldSecondaryColor22.copyWith(
                    color:
                        isActive ? AppColors.blue : AppColors.fontPrimaryColor,
                    fontSize: isLandacape ? 8.sp : 14.sp,
                  ),
                ),
              ),
              if (isExpandable)
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_right,
                  size: 16.sp,
                  color: AppColors.grey300,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
