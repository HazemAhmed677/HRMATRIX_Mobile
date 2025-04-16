import 'package:flutter/material.dart';
import 'package:hrmatrix/features/auth/ui/widgets/word_of_textfield.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/app_color.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class EmailAndPasswordPart extends StatefulWidget {
  const EmailAndPasswordPart({
    super.key,
    required this.onChanged1,
    required this.onChanged2,
  });
  final void Function(String) onChanged1;
  final void Function(String) onChanged2;
  @override
  State<EmailAndPasswordPart> createState() => _EmailAndPasswordPartState();
}

class _EmailAndPasswordPartState extends State<EmailAndPasswordPart> {
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WordOfTextfield(text: 'Email'),
        verticalSpace(8),
        CustomTextFormField(
          hint: 'example@gmail.com',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            } else if (!value.contains('@')) {
              return 'Please enter a valid email';
            } else {
              return null;
            }
          },
          onChanged: widget.onChanged1,
        ),
        verticalSpace(14),
        const WordOfTextfield(text: 'Password'),
        verticalSpace(8),
        CustomTextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            } else if (value.length < 6) {
              return 'Password must be at least 6 characters';
            } else {
              return null;
            }
          },
          hint: '**********',
          suffixIcon: IconButton(
            onPressed: () {
              flag = !flag;
              setState(() {});
            },
            icon:
                (!flag)
                    ? Icon(Icons.visibility_off, color: Colors.grey.shade800)
                    : const Icon(Icons.visibility, color: AppColors.grey300),
          ),
          obscure: !flag,
          onChanged: widget.onChanged2,
        ),
      ],
    );
  }
}
