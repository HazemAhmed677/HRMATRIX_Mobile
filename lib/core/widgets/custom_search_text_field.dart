import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/theming/app_color.dart';
import '../../../../core/typography/app_padding.dart';

class CustomSearchTextFeild extends StatelessWidget {
  const CustomSearchTextFeild({
    super.key,
    this.validator,
    this.onSubmitted,
    this.onPressedOnIcon,
    this.onChanged,
    this.onTap,
    required this.readOnly,
    this.controller,
    this.suffixIcon,
    this.hintText = 'Search...',
  });
  final TextEditingController? controller;
  final Function()? onTap;
  final bool readOnly;
  final String? Function(String?)? validator;
  final Function(String?)? onSubmitted;
  final Function()? onPressedOnIcon;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      readOnly: readOnly,
      onChanged: onChanged,
      validator: validator,
      onFieldSubmitted: onSubmitted,
      cursorColor: AppColors.fontPrimaryColor,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppPadding.pMainHorizental22.w,
          vertical: AppPadding.p12.h,
        ),
        hintFadeDuration: const Duration(milliseconds: 200),
        prefixIcon: IconButton(
          onPressed: onPressedOnIcon,
          icon: Icon(
            FontAwesomeIcons.magnifyingGlass,
            size:
                MediaQuery.of(context).orientation == Orientation.landscape
                    ? 12.sp
                    : 18.sp,
            color: AppColors.grey400,
          ),
          color: AppColors.grey900,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.grey,
          fontSize:
              MediaQuery.of(context).orientation == Orientation.landscape
                  ? 8.sp
                  : 14.sp,
        ),
        enabledBorder: buildBorder(color: AppColors.grey500),
        focusedBorder: buildBorder(color: AppColors.grey500),
        errorBorder: buildBorder(color: Colors.redAccent.shade100),
        focusedErrorBorder: buildBorder(color: Colors.redAccent.shade100),
        filled: true,
        fillColor: AppColors.white,
      ),
    );
  }

  OutlineInputBorder buildBorder({required Color color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(12.sp),
    );
  }
}
