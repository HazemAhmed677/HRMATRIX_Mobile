import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/theming/app_color.dart';

import '../typography/font_weight_helper.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart'; // Assuming you're using screen util
// import 'app_colors.dart'; // Assuming AppColors is defined elsewhere
// import 'font_weight_helper.dart'; // Assuming you have custom font weight helpers

class AppStyles {
  static TextStyle regular17 = TextStyle(
    fontSize: 17.sp,
    fontFamily: 'Nexa',
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle boldSecondaryColor22 = TextStyle(
    fontFamily: 'Nexa',
    fontSize: 22.sp,
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle semiBoldDarkGrey16 = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'Nexa',
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle semiBoldDarkGrey18 = TextStyle(
    fontSize: 18.sp,
    fontFamily: 'Nexa',
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle semiBoldDarkGrey24 = TextStyle(
    fontSize: 24.sp,
    fontFamily: 'Nexa',
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle semiBoldNoColor18 = TextStyle(
    fontSize: 18.sp,
    fontFamily: 'Nexa',
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle boldNoColor18 = TextStyle(
    fontSize: 18.sp,
    fontFamily: 'Nexa',
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle boldNoColor20 = TextStyle(
    fontSize: 20.sp,
    fontFamily: 'Nexa',
    fontWeight: FontWeightHelper.bold,
  );

  static TextStyle mediumDarkGrey14 = TextStyle(
    fontSize: 14.sp,
    fontFamily: 'Nexa',
    fontWeight: FontWeightHelper.medium,
  );
  static TextStyle poppinsSemiBold18 = TextStyle(
    fontSize: 14.sp,
    fontFamily: 'Nexa',
    fontWeight: FontWeightHelper.semiBold,
  );

  static TextStyle primaryStyle = TextStyle(
    color: AppColors.fontPrimaryColor,
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.extraBold,
  );
  static TextStyle secondaryStyle = TextStyle(
    color: AppColors.fontSecondayColor,
    fontWeight: FontWeightHelper.bold,
  );
}
