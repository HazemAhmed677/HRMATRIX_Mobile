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
    this.fontWeight = FontWeightHelper.extraBold,
    this.fontSize = 15,
    this.horizentalPadding,
    this.verticalPadding,
  });
  final Color edgeColor;
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final Color overlayColor;
  final Function()? onPressed;
  final RoundedRectangleBorder? shape;
  final Size size;
  final FontWeight fontWeight;
  final double fontSize;

  final double? horizentalPadding;
  final double? verticalPadding;

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
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizentalPadding?.w ?? 0,
          vertical: verticalPadding?.h ?? 0,
        ),
        child: Text(
          text,
          style: AppStyles.boldNoColor18.copyWith(
            color: textColor,
            fontSize: fontSize.sp,
            fontWeight: fontWeight,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
