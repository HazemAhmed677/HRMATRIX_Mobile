import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/features/login/ui/widgets/login_top_section.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/app_color.dart';

class LogInViewBody extends StatelessWidget {
  const LogInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.0.w),
            child: Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                clipBehavior: Clip.none,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [const LogInTopSection(), verticalSpace(18)],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
