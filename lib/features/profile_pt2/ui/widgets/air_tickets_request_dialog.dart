import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helpers/spacing.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/core/widgets/custom_logout_button.dart';
import 'package:hrmatrix/core/widgets/custom_text_form_field.dart';

import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/close_widget.dart';
import '../../../requests/ui/widgets/document_dialog_expiration_date.dart';

class AirTicketsRequestDialog extends StatefulWidget {
  const AirTicketsRequestDialog({super.key});

  @override
  State<AirTicketsRequestDialog> createState() =>
      _AirTicketsRequestDialogState();
}

class _AirTicketsRequestDialogState extends State<AirTicketsRequestDialog> {
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
                      "Request New Air Ticket",
                      style: AppStyles.primaryStyle.copyWith(fontSize: 12.sp),
                    ),
                    verticalSpace(8),
                    Text(
                      "Submit a new air ticket allowance request.",
                      style: AppStyles.secondaryStyle.copyWith(fontSize: 7.sp),
                    ),
                  ],
                ),
                Spacer(),
                CloseWidget(),
              ],
            ),
            verticalSpace(48),

            CustomTextFormField(
              hint: 'Enter name(e.g., flight route)',
              label: "Name",
            ),

            verticalSpace(38),

            CustomTextFormField(hint: 'Enter amount', label: "Amount"),

            verticalSpace(48),

            DocumentDialogExpirationDate(label: 'Dropping Date', hint: ''),
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
                    text: 'Request Air Ticket',
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
