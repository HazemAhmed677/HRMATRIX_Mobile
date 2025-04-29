import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hrmatrix/core/di/set_up.dart';
import 'package:hrmatrix/core/helpers/spacing.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/core/widgets/custom_logout_button.dart';
import 'package:hrmatrix/features/profile_pt1/data/models/reset_passwrd_request.dart';
import 'package:hrmatrix/features/profile_pt1/data/repo/profile_pt1_repo_impl.dart';

import '../../../../core/helpers/show_top_snack_bar.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/close_widget.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../logic/reset_password/reset_password_cubit.dart';

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
  final TextEditingController _oldPasswordController = TextEditingController();

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
    return BlocProvider(
      create:
          (context) => ResetPasswordCubit(
            profilePt1RepoImpl: getIt.get<ProfilePt1RepoImpl>(),
          ),
      child: Builder(
        builder: (context) {
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
                            style: AppStyles.secondaryStyle.copyWith(
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const CloseWidget(),
                    ],
                  ),
                  verticalSpace(18),
                  CustomTextFormField(
                    textEditingController: _oldPasswordController,
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
                            context.pop();
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
                      BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                        listener: (context, state) {
                          if (state is ResetPasswordSuccess) {
                            context.pop();
                            showSuccessSnackBar(
                              context: context,
                              e: 'Password reset successfully',
                              backgroundColor: AppColors.blue,
                            );
                          } else if (state is ResetPasswordFailure) {
                            showErrorSnackBar(
                              context: context,
                              e: state.errorMsg,
                              backgroundColor: AppColors.red,
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is ResetPasswordLoading) {
                            return Expanded(
                              child: Center(
                                child: const CircularProgressIndicator(
                                  color: AppColors.blue,
                                ),
                              ),
                            );
                          }
                          return CustomActionButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                await BlocProvider.of<ResetPasswordCubit>(
                                  context,
                                ).resetPassword(
                                  resetPasswordModel: ResetPasswrdRequestModel(
                                    oldPassword: _oldPasswordController.text,
                                    newPassword: _newPasswordController.text,
                                    confirmPassword:
                                        _confirmPasswordController.text,
                                  ),
                                );
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
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
