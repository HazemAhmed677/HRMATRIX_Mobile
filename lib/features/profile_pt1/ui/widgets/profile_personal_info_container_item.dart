import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_styles.dart';

class ProfilePersonalInfoContainerItem extends StatelessWidget {
  const ProfilePersonalInfoContainerItem({
    super.key,
    required this.header1,
    required this.header2,
    required this.title1,
    required this.title2,
  });

  final String header1;
  final String header2;

  final String title1;
  final String title2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(header1, style: AppStyles.secondaryStyle),
                  verticalSpace(4),
                  Text(
                    title1,
                    style: AppStyles.primaryStyle.copyWith(fontSize: 14.sp),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(header2, style: AppStyles.secondaryStyle),
                  verticalSpace(4),
                  Text(
                    title2,
                    style: AppStyles.primaryStyle.copyWith(fontSize: 14.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
        verticalSpace(8),
      ],
    );
  }
}
