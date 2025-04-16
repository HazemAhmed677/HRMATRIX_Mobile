import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/features/login/ui/widgets/sign_word.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/typography/app_images.dart';
import '../../../../core/widgets/custom_logout_button.dart';
import 'email_and_password_part.dart';

class LogInTopSection extends StatefulWidget {
  const LogInTopSection({super.key});
  @override
  State<LogInTopSection> createState() => _LogInTopSectionState();
}

class _LogInTopSectionState extends State<LogInTopSection> {
  String email = '', password = '';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpace(12),
          SizedBox(
            height: 180.h,
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(AppImages.aimatrix),
            ),
          ),
          SignWord(
            title: 'Welcome to AIMATRIX',
            subTitle: r"Sign in to continue",
            height: 12.h,
          ),
          verticalSpace(42),
          EmailAndPasswordPart(
            onChanged1: (value) {
              email = value;
            },
            onChanged2: (value) {
              password = value;
            },
          ),
          verticalSpace(32),
          CustomActionButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                autovalidateMode = AutovalidateMode.disabled;
                // trigger logic here
                // context.push(Routes.switcherView);
              } else {
                autovalidateMode = AutovalidateMode.always;
              }
              setState(() {});
            },
            text: 'Log In',
            edgeColor: AppColors.customActionButton,
            backgroundColor: AppColors.authColor,
            textColor: AppColors.white,
            overlayColor: AppColors.white,
            size: Size(MediaQuery.sizeOf(context).width, 50.h),
            fontSize: 18,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ],
      ),
    );
  }
}
