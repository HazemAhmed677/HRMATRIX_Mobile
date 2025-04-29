import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hrmatrix/core/di/set_up.dart';
import 'package:hrmatrix/core/helpers/show_top_snack_bar.dart';
import 'package:hrmatrix/core/helpers/spacing.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/core/widgets/custom_logout_button.dart';
import 'package:hrmatrix/core/widgets/custom_text_form_field.dart';
import 'package:hrmatrix/features/profile_pt1/data/models/edit_profile_request_model.dart';
import 'package:hrmatrix/features/profile_pt1/data/repo/profile_pt1_repo_impl.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/helpers/update_employee_model.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/loading_widget.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/profile_drop_your_image.dart';
import 'package:hrmatrix/main.dart';
import 'package:provider/provider.dart';

import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/close_widget.dart';
import '../../logic/edit_profile/edit_profile_cubit.dart';

class ProfileEditDialogWidget extends StatefulWidget {
  const ProfileEditDialogWidget({super.key});

  @override
  State<ProfileEditDialogWidget> createState() =>
      _ProfileEditDialogWidgetState();
}

class _ProfileEditDialogWidgetState extends State<ProfileEditDialogWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  EditProfileRequestModel editProfileRequestModel = EditProfileRequestModel();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => EditProfileCubit(
            profilePt1RepoImpl: getIt.get<ProfilePt1RepoImpl>(),
          ),
      child: Builder(
        builder: (context) {
          return Provider(
            create: (BuildContext context) => editProfileRequestModel,
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
                            style: AppStyles.secondaryStyle.copyWith(
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      CloseWidget(),
                    ],
                  ),
                  verticalSpace(18),
                  CustomTextFormField(
                    textEditingController: nameController,
                    hint: employeeModel!.name!,
                    label: 'Name',
                  ),
                  verticalSpace(18),
                  CustomTextFormField(
                    textEditingController: addressController,
                    hint: employeeModel!.address!,
                    label: 'Address',
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
                      BlocConsumer<EditProfileCubit, EditProfileState>(
                        listener: (context, state) async {
                          if (state is EditProfileSuccess) {
                            // update employee model

                            await updateEmployeeModel(
                              newOne: state.employeeModel,
                            );
                            if (context.mounted) {
                              context.pop();

                              showSuccessSnackBar(
                                context: context,
                                e: 'Updated successfully',
                                backgroundColor: AppColors.green,
                              );
                            }
                          } else if (state is EditProfileFailure) {
                            showErrorSnackBar(
                              context: context,
                              e: state.errorMsg,
                              backgroundColor: AppColors.red,
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is EditProfileLoading) {
                            return LoadingWidget();
                          }
                          return CustomActionButton(
                            onPressed: () async {
                              if (employeeModel!.name != nameController.text ||
                                  employeeModel!.address !=
                                      addressController.text ||
                                  editProfileRequestModel.imageFile != null) {
                                // make logic
                                editProfileRequestModel.name =
                                    nameController.text;
                                editProfileRequestModel.address =
                                    addressController.text;
                                await BlocProvider.of<EditProfileCubit>(
                                  context,
                                ).editProfile(
                                  editProfileRequestModel:
                                      editProfileRequestModel,
                                );
                              } else {
                                showErrorSnackBar(
                                  context: context,
                                  e: 'No changes made to update',
                                  backgroundColor: AppColors.red,
                                );
                              }
                            },
                            text: 'Edit',
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
