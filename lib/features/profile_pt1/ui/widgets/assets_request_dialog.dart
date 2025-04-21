import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helper/spacing.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/core/widgets/custom_logout_button.dart';
import 'package:hrmatrix/core/widgets/custom_text_form_field.dart';

import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/close_widget.dart';
import 'document_dialog_choose_one.dart';
import 'document_dialog_expiration_date.dart';

class AssetsRequestDialog extends StatefulWidget {
  const AssetsRequestDialog({super.key});

  @override
  State<AssetsRequestDialog> createState() => _AssetsRequestDialogState();
}

class _AssetsRequestDialogState extends State<AssetsRequestDialog> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

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
                    Text(
                      "Add New Asset",
                      style: AppStyles.primaryStyle.copyWith(fontSize: 12.sp),
                    ),
                    verticalSpace(8),
                    Text(
                      "Submit a new asset request.",
                      style: AppStyles.secondaryStyle.copyWith(fontSize: 7.sp),
                    ),
                  ],
                ),
                Spacer(),
                CloseWidget(),
              ],
            ),
            verticalSpace(38),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    hint: 'Enter asset name',
                    label: "Name",
                  ),
                ),

                horizontalSpace(10),
                Expanded(
                  child: CustomTextFormField(
                    hint: 'Enter serial number',
                    label: "Serial Number",
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            verticalSpace(38),

            CustomTextFormField(hint: '', label: "Description", maxLines: 2),
            verticalSpace(48),
            CustomTextFormField(hint: 'Enter condition', label: "Condition"),
            verticalSpace(48),

            Row(
              children: [
                Expanded(
                  child: DocumentDialogExpirationDate(label: 'Holding Date'),
                ),
                horizontalSpace(10),
                Expanded(
                  child: DocumentDialogExpirationDate(label: 'Dropping Date'),
                ),
              ],
            ),
            verticalSpace(48),
            DocumentDialogChooseOne(text: 'Upload an asset'),
            verticalSpace(52),
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
                    fontSize: 8,
                    overlayColor: AppColors.customActionButton,
                    size: Size(MediaQuery.sizeOf(context).width, 90.h),
                  ),
                ),
                horizontalSpace(12),
                Expanded(
                  child: CustomActionButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pop(context);
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                    text: 'Request Asset',
                    edgeColor: AppColors.customActionButton,
                    backgroundColor: AppColors.customActionButton,
                    textColor: AppColors.white,
                    overlayColor: AppColors.white,
                    size: Size(MediaQuery.sizeOf(context).width, 90.h),
                    fontSize: 8,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
