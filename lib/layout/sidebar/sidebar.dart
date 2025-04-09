import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helper/spacing.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/core/typography/app_images.dart';
import 'package:hrmatrix/core/typography/app_padding.dart';
import 'package:hrmatrix/layout/sidebar/logic/sidebar_cubit.dart';
import 'package:hrmatrix/layout/sidebar/logic/sidebar_state.dart';
import 'package:hrmatrix/layout/sidebar/widgets/helpers/get_headlins.dart';
import 'package:hrmatrix/layout/sidebar/widgets/helpers/get_icons.dart';
import 'package:hrmatrix/layout/sidebar/widgets/sidebar_item.dart';

import '../../core/theming/app_styles.dart';
import '../../core/typography/font_weight_helper.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  final List<String> items = getHeadlines();
  final List<IconData> icons = getIcons();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SidebarCubit, SidebarState>(
      builder: (context, state) {
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          left: 0,
          top: (65 + 30).h,
          width: MediaQuery.sizeOf(context).width * 0.7,
          height: MediaQuery.sizeOf(context).height - kToolbarHeight,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.borderColor),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.pMainHorizental22.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(12),
                  SizedBox(
                    height: 100.h,
                    child: Image.asset(AppImages.aimatrix),
                  ),
                  verticalSpace(22),

                  Text(
                    "MENU",
                    style: AppStyles.boldNoColor18.copyWith(
                      color: AppColors.grey400,
                      fontSize: 14.sp,
                      fontWeight: FontWeightHelper.bold,
                    ),
                  ),
                  verticalSpace(12),

                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final selected = state.selectedIndex == index;
                        return SidebarItem(
                          title: items[index],
                          iconData: icons[index],
                          onTap: () {
                            context.read<SidebarCubit>().selectIndex(index);
                          },
                          isActive: selected,
                        );
                      },
                    ),
                  ),
                  verticalSpace(45),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
