import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helper/spacing.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/core/widgets/custom_logout_button.dart';
import 'package:hrmatrix/core/widgets/custom_text_form_field.dart';
import 'package:hrmatrix/features/profile/ui/widgets/document_dialog_choose_one.dart';

import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/close_widget.dart';
import 'document_dialog_drop_down.dart';
import 'document_dialog_expiration_date.dart';

class DocumentAddDialogWidget extends StatefulWidget {
  const DocumentAddDialogWidget({super.key});

  @override
  State<DocumentAddDialogWidget> createState() =>
      _DocumentAddDialogWidgetState();
}

class _DocumentAddDialogWidgetState extends State<DocumentAddDialogWidget> {
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
                      "Add New Document",
                      style: AppStyles.primaryStyle.copyWith(fontSize: 12.sp),
                    ),
                    verticalSpace(8),
                    Text(
                      "Keep your profile up-to-date by adding\nor updating your documents.",
                      style: AppStyles.secondaryStyle.copyWith(fontSize: 7.sp),
                    ),
                  ],
                ),
                Spacer(),
                CloseWidget(),
              ],
            ),
            verticalSpace(38),
            DocumentDialogChooseOne(),
            verticalSpace(48),
            DocumentDialogDropDown(),
            verticalSpace(48),
            CustomTextFormField(hint: '', label: "Description", maxLines: 3),
            verticalSpace(48),
            DocumentDialogExpirationDate(),
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
                    text: 'Add Document',
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
