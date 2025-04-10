import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/app_styles.dart';

class ProfileMiddleContainerItem extends StatelessWidget {
  const ProfileMiddleContainerItem({
    super.key,
    required this.header,
    required this.jobTitle,
    this.isLastELement = false,
  });

  final String header;
  final String jobTitle;
  final bool isLastELement;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(header, style: AppStyles.secondaryStyle),
        verticalSpace(4),
        Text(jobTitle, style: AppStyles.primaryStyle.copyWith(fontSize: 14.sp)),
        if (!isLastELement) verticalSpace(10),
      ],
    );
  }
}
