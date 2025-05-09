import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helpers/spacing.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/core/theming/app_styles.dart';
import 'package:hrmatrix/core/typography/font_weight_helper.dart';
import 'package:hrmatrix/features/profile_pt1/data/models/edit_profile_request_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

class ProfileDropYourImage extends StatefulWidget {
  const ProfileDropYourImage({super.key});

  @override
  State<ProfileDropYourImage> createState() => _ProfileDropYourImageState();
}

class _ProfileDropYourImageState extends State<ProfileDropYourImage> {
  File? pickedImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        pickedImage = File(image.path);
        context.read<EditProfileRequestModel>().imageFile = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: const Color(0xFFF9FAFB),
          border: Border.all(color: const Color(0xFFD1D5DB)), // grey300
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(4.0.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                LucideIcons.imageOff,
                size: 42.sp,
                color: const Color(0xFF6B7280), // grey500
              ),
              SizedBox(height: 12.h),
              Text(
                "Drop your profile image here",
                style: AppStyles.primaryStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
              verticalSpace(8),
              Text(
                pickedImage == null
                    ? "Drag and drop your images here or click to browse"
                    : pickedImage!.path.split('/').last,
                style: AppStyles.secondaryStyle.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeightHelper.regular,
                  color: AppColors.grey400, // grey500
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
