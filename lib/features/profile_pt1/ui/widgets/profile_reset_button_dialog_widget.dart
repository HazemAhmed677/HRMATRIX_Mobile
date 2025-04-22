import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helpers/spacing.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/core/widgets/custom_logout_button.dart';

import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/close_widget.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class ProfileResetButtonDialogWidget extends StatefulWidget {
  const ProfileResetButtonDialogWidget({super.key});

  @override
  State<ProfileResetButtonDialogWidget> createState() =>
      _ProfileResetButtonDialogWidgetState();
}

class _ProfileResetButtonDialogWidgetState
    extends State<ProfileResetButtonDialogWidget> {
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
                    Text("Reset Password", style: AppStyles.primaryStyle),
                    verticalSpace(8),
                    Text(
                      "You can reset the password\nfor the user here.",
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
              label: "Old Password",
              hint: '*******',
              obscure: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            verticalSpace(22),
            CustomTextFormField(
              textEditingController: _newPasswordController,
              label: "New Password",
              hint: '*******',
              obscure: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your new password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            verticalSpace(22),
            CustomTextFormField(
              textEditingController: _confirmPasswordController,
              label: "Confirm New Password",
              hint: '*******',
              obscure: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your new password';
                }
                if (value != _newPasswordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            verticalSpace(32),
            Row(
              children: [
                Expanded(
                  child: CustomActionButton(
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
                  text: 'Save Changes',
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
