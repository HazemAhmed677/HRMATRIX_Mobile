import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_styles.dart';
import '../typography/font_weight_helper.dart';

class CustomActionButton extends StatelessWidget {
  const CustomActionButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.edgeColor,
    required this.backgroundColor,
    required this.textColor,
    required this.overlayColor,
    this.shape,
    required this.size,
  });
  final Color edgeColor;
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final Color overlayColor;
  final Function()? onPressed;
  final RoundedRectangleBorder? shape;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        overlayColor: overlayColor,
        side: BorderSide(
          width: 1.0, // Border width
          color: edgeColor, // Border color
        ),
        shape: shape,
        minimumSize: size,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: AppStyles.boldNoColor18.copyWith(
          color: textColor,
          fontSize: 15.sp,
          fontWeight: FontWeightHelper.extraBold,
        ),
      ),
    );
  }
}
