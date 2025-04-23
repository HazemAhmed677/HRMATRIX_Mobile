import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helpers/spacing.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/core/widgets/custom_logout_button.dart';
import 'package:hrmatrix/core/widgets/custom_text_form_field.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/over_time_start_date.dart';

import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/close_widget.dart';
import '../../../requests/ui/widgets/document_dialog_expiration_date.dart';

class TimeOffDialog extends StatefulWidget {
  const TimeOffDialog({super.key});

  @override
  State<TimeOffDialog> createState() => _TimeOffDialogState();
}

class _TimeOffDialogState extends State<TimeOffDialog> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
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
                      "Add Time Off Request",
                      style: AppStyles.primaryStyle.copyWith(
                        fontSize: isLandscape ? 12.sp : 16.sp,
                      ),
                    ),
                    isLandscape ? verticalSpace(8) : verticalSpace(4),
                    Text(
                      "Add a new time off request.",
                      style: AppStyles.secondaryStyle.copyWith(
                        fontSize: isLandscape ? 7.sp : 12.sp,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                CloseWidget(),
              ],
            ),
            isLandscape ? verticalSpace(38) : verticalSpace(18),
            DocumentDialogExpirationDate(label: 'Time Off Date'),

            isLandscape ? verticalSpace(48) : verticalSpace(28),
            Row(
              children: [
                OverTimeStartAndEndDate(title: 'From Hour', hint: '3:20 PM'),
                horizontalSpace(10),
                OverTimeStartAndEndDate(title: 'To Hour', hint: '5:20 PM'),
              ],
            ),
            isLandscape ? verticalSpace(48) : verticalSpace(28),
            CustomTextFormField(hint: '', label: "Description", maxLines: 2),

            isLandscape ? verticalSpace(52) : verticalSpace(32),
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
                    size: Size(
                      MediaQuery.sizeOf(context).width,
                      isLandscape ? 90.h : 40.h,
                    ),
                    fontSize: isLandscape ? 8 : 12,
                  ),
                ),
                horizontalSpace(12),
                Expanded(
                  child: CustomActionButton(
                    verticalPadding: isLandscape ? 0 : 4,
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
                    size: Size(
                      MediaQuery.sizeOf(context).width,
                      isLandscape ? 90.h : 36.h,
                    ),
                    fontSize: isLandscape ? 8 : 12,
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
