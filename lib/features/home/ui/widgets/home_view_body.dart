import 'package:flutter/material.dart';
import 'package:hrmatrix/core/helpers/spacing.dart';
import 'package:hrmatrix/core/typography/font_weight_helper.dart';
import 'package:hrmatrix/features/home/ui/widgets/home_common_container.dart';
import 'package:hrmatrix/features/home/ui/widgets/working_hours_component.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeCommonContainer(title: '0 / 16', subtitle: 'Days Off Credit'),
          verticalSpace(24),
          HomeCommonContainer(title: '0 / 5', subtitle: 'Sick Days Off Credit'),
          verticalSpace(24),

          HomeCommonContainer(title: '0', subtitle: "This Week's Tasks"),
          verticalSpace(24),

          HomeCommonContainer(title: "This Week's Tasks", titleFontSize: 17),
          verticalSpace(24),
          WorkingHoursComponent(
            progressPercentage: 0.5, // 75% filled
          ),
          verticalSpace(24),

          HomeCommonContainer(
            title: "No One Works Remotly Today",
            titleFontSize: 25,
            titleFontWeight: FontWeightHelper.semiBold,
          ),
        ],
      ),
    );
  }
}
