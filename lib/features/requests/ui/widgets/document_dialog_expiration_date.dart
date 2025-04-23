import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helpers/spacing.dart';
import 'package:hrmatrix/core/widgets/custom_text_form_field.dart';

import '../../../../core/theming/app_styles.dart';

class DocumentDialogExpirationDate extends StatefulWidget {
  const DocumentDialogExpirationDate({
    super.key,
    this.label = 'Expiration Date',
    this.validator,
    this.onTap,
    required this.hint,
  });
  final String label;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final String hint;
  @override
  State<DocumentDialogExpirationDate> createState() =>
      _DocumentDialogExpirationDateState();
}

class _DocumentDialogExpirationDateState
    extends State<DocumentDialogExpirationDate> {
  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: AppStyles.secondaryStyle.copyWith(
            fontSize: isLandscape ? 7.sp : 12.sp,
          ),
        ),
        isLandscape ? verticalSpace(24) : verticalSpace(12),
        CustomTextFormField(
          hint: widget.hint,
          readOnly: true,
          onTap: widget.onTap,
          validator: widget.validator,
        ),
      ],
    );
  }
}
