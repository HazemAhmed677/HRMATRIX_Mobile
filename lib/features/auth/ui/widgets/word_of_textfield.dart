import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../core/theming/app_color.dart';

class WordOfTextfield extends StatelessWidget {
  const WordOfTextfield({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: AppStyles.boldNoColor20.copyWith(
          fontSize: 16.sp,
          color: AppColors.grey800,
        ),
      ),
    );
  }
}
