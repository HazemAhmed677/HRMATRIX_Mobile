import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_color.dart';
import '../theming/app_styles.dart';
import '../typography/font_weight_helper.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    this.obscure,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.textEditingController,
    this.onSubmitted,
    this.keyboardType,
    this.filled = true,
    this.label,
    this.readOnly,
    this.onTap,
    this.maxLines = 1,
  });
  final String? label;
  final bool filled;
  final String hint;
  final bool? obscure;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextEditingController? textEditingController;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final void Function()? onTap;
  final int maxLines;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool? obsecureOne;
  @override
  void initState() {
    if (widget.obscure != null) obsecureOne = widget.obscure!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines,
      onTap: widget.onTap,
      readOnly: widget.readOnly ?? false,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      validator: widget.validator,
      obscureText: obsecureOne ?? false,
      cursorColor: AppColors.fontPrimaryColor,
      decoration: InputDecoration(
        label:
            widget.label != null
                ? Text(
                  widget.label!,
                  style: AppStyles.boldNoColor18.copyWith(
                    fontSize:
                        MediaQuery.orientationOf(context) ==
                                Orientation.landscape
                            ? 8.sp
                            : 12.sp,
                    color: AppColors.fontPrimaryColor,
                  ),
                )
                : null,
        fillColor: AppColors.grey50,
        filled: widget.filled,
        suffixIcon:
            widget.obscure != null
                ? GestureDetector(
                  onTap: () {
                    setState(() {
                      obsecureOne = !obsecureOne!;
                    });
                  },
                  child: Icon(
                    !obsecureOne! ? Icons.visibility : Icons.visibility_off,
                    color:
                        !obsecureOne!
                            ? AppColors.fontPrimaryColor
                            : AppColors.grey,
                  ),
                )
                : null,
        contentPadding: EdgeInsets.symmetric(
          horizontal:
              MediaQuery.orientationOf(context) == Orientation.landscape
                  ? 10.w
                  : 20.w,
          vertical: 14.h,
        ),
        hintFadeDuration: const Duration(milliseconds: 200),
        hintText: widget.hint,
        hintStyle: AppStyles.boldNoColor18.copyWith(
          color: AppColors.grey600,
          fontSize:
              MediaQuery.orientationOf(context) == Orientation.landscape
                  ? 6.sp
                  : 12.sp,
          fontWeight: FontWeightHelper.semiBold,
        ),
        enabledBorder: buildBorder(color: AppColors.grey100),
        focusedBorder: buildBorder(color: AppColors.grey100),
        errorBorder: buildBorder(color: Colors.redAccent.shade100),
        focusedErrorBorder: buildBorder(color: Colors.redAccent.shade100),
      ),
    );
  }

  OutlineInputBorder buildBorder({required Color color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(8.0.r),
    );
  }
}
