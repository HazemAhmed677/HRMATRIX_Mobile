import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hrmatrix/core/theming/app_styles.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/app_color.dart';
import '../../../../core/typography/font_weight_helper.dart';

// ... keep your existing imports ...

class SignOutAlert extends StatefulWidget {
  const SignOutAlert({super.key});

  @override
  State<SignOutAlert> createState() => _SignOutAlertState();
}

class _SignOutAlertState extends State<SignOutAlert>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: _buildDialogContent(),
        ),
      ),
    );
  }

  Widget _buildDialogContent() {
    return Container(
      margin: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(28.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
            blurRadius: 20.r,
            spreadRadius: 5.r,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildAnimatedIllustration(),
            verticalSpace(20),
            _buildTitle(),
            verticalSpace(12),
            _buildMessage(),
            verticalSpace(24),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedIllustration() {
    return SizedBox(
      width: 120.w,
      height: 120.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.fontSecondayColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
          ),
          Lottie.asset(
            'assets/animations/logout.json',
            width: 120.w,
            height: 120.h,
            repeat: true,
            animate: true,
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Log Out',
      style: AppStyles.mediumDarkGrey14.copyWith(
        fontSize: 18.sp,
        fontWeight: FontWeightHelper.bold,
        color: AppColors.fontSecondayColor,
        letterSpacing: 0.5,
      ),
    );
  }

  Widget _buildMessage() {
    return Text(
      'Are you sure you want to log out of your account?',
      style: AppStyles.mediumDarkGrey14.copyWith(
        fontSize: 14.sp,
        color: AppColors.black.withValues(alpha: 0.8),
        height: 1.4,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(child: _buildCancelButton()),
        horizontalSpace(16),
        Expanded(child: _buildConfirmButton()),
      ],
    );
  }

  Widget _buildCancelButton() {
    return OutlinedButton(
      onPressed: () => context.pop(),
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
          side: BorderSide(color: AppColors.grey300),
        ),
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.close_rounded, size: 20.w, color: AppColors.grey600),
          horizontalSpace(8),
          Text(
            'Cancel',
            style: AppStyles.semiBoldDarkGrey16.copyWith(
              fontSize: 15.sp,
              color: AppColors.grey800,
              fontWeight: FontWeightHelper.semiBold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConfirmButton() {
    return ElevatedButton(
      onPressed: () async {
        // sign out here
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        backgroundColor: AppColors.blue,
        elevation: 3,
        shadowColor: AppColors.fontSecondayColor.withValues(alpha: 0.3),
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout_rounded, size: 20.w, color: AppColors.white),
            horizontalSpace(8),
            Text(
              'Log Out',
              style: AppStyles.boldNoColor18.copyWith(
                fontSize: 15.sp,
                color: AppColors.white,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
