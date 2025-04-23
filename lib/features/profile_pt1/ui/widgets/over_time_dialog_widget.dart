import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helpers/spacing.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/core/widgets/custom_logout_button.dart';
import 'package:hrmatrix/core/widgets/custom_text_form_field.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/over_time_hours.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/over_time_start_date.dart';

import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/close_widget.dart';
import '../../../requests/ui/widgets/document_dialog_expiration_date.dart';

class OverTimeDialogWidget extends StatefulWidget {
  const OverTimeDialogWidget({super.key});

  @override
  State<OverTimeDialogWidget> createState() => _OverTimeDialogWidgetState();
}

class _OverTimeDialogWidgetState extends State<OverTimeDialogWidget> {
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
                      "Request New Over Time",
                      style: AppStyles.primaryStyle.copyWith(fontSize: 12.sp),
                    ),
                    verticalSpace(8),
                    Text(
                      "Submit a new overtime request.",
                      style: AppStyles.secondaryStyle.copyWith(fontSize: 7.sp),
                    ),
                  ],
                ),
                Spacer(),
                CloseWidget(),
              ],
            ),
            verticalSpace(38),
            CustomTextFormField(hint: '', label: "Description", maxLines: 2),
            verticalSpace(48),
            OverTimeHours(),
            verticalSpace(48),
            DocumentDialogExpirationDate(hint: ''),
            verticalSpace(48),
            OverTimeStartAndEndDate(title: 'Start Time', hint: '3:20 AM'),
            verticalSpace(48),
            OverTimeStartAndEndDate(title: 'End Time', hint: '12:20 PM'),
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
                    text: 'Request Over Time',
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
