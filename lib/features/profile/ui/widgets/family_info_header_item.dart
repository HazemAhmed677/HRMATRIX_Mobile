import 'package:flutter/material.dart';

import '../../../../core/theming/app_styles.dart';

class FamilyInfoHeaderItem extends StatelessWidget {
  const FamilyInfoHeaderItem({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Text(text, style: AppStyles.secondaryStyle),
    );
  }
}
