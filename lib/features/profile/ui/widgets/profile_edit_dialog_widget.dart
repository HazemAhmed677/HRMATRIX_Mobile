import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helper/spacing.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/core/widgets/custom_logout_button.dart';
import 'package:hrmatrix/core/widgets/custom_text_form_field.dart';
import 'package:hrmatrix/features/profile/ui/widgets/profile_drop_your_image.dart';

import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/close_widget.dart';

class ProfileEditDialogWidget extends StatefulWidget {
  const ProfileEditDialogWidget({super.key});

  @override
  State<ProfileEditDialogWidget> createState() =>
      _ProfileEditDialogWidgetState();
}

class _ProfileEditDialogWidgetState extends State<ProfileEditDialogWidget> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Edit Profile", style: AppStyles.primaryStyle),
                    verticalSpace(8),
                    Text(
                      "Update your profile details here.",
                      style: AppStyles.secondaryStyle.copyWith(fontSize: 12.sp),
                    ),
                  ],
                ),
                Spacer(),
                CloseWidget(),
              ],
            ),
            verticalSpace(18),

            CustomTextFormField(
              hint: 'Hazem Ahmed',
              label: 'Name',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            verticalSpace(18),
            ProfileDropYourImage(),
            verticalSpace(32),
            Row(
              children: [
                Spacer(),
                CustomActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: 'Cancel',
                  edgeColor: AppColors.grey300,
                  backgroundColor: AppColors.white,
                  textColor: AppColors.black,
                  overlayColor: AppColors.customActionButton,
                  size: Size(100.w, 50.h),
                ),
                horizontalSpace(12),
                CustomActionButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pop(context);
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  text: 'Edit',
                  edgeColor: AppColors.customActionButton,
                  backgroundColor: AppColors.customActionButton,
                  textColor: AppColors.white,
                  overlayColor: AppColors.white,
                  size: Size(100.w, 50.h),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
