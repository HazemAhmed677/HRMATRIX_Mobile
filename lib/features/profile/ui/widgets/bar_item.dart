import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helper/spacing.dart';
import 'package:hrmatrix/core/theming/app_color.dart';

class BarItem extends StatelessWidget {
  const BarItem({super.key, required this.item, required this.isActive});

  final Map<String, dynamic> item;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width:
          MediaQuery.of(context).orientation == Orientation.landscape
              ? 70.w
              : 94.w,
      decoration: BoxDecoration(
        color: isActive ? AppColors.deepPurple : AppColors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
        border: Border.all(width: 2, color: AppColors.borderColor),
      ),
      padding: const EdgeInsets.all(12),
      duration: Duration(milliseconds: 200),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            item['icon'],
            size:
                MediaQuery.of(context).orientation == Orientation.landscape
                    ? 16.sp
                    : 26.sp,
            color: isActive ? AppColors.white : AppColors.deepPurple,
          ),
          verticalSpace(8),
          Text(
            item['label'],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize:
                  MediaQuery.of(context).orientation == Orientation.landscape
                      ? 8.sp
                      : 12.sp,
              color: isActive ? AppColors.white : AppColors.black,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
