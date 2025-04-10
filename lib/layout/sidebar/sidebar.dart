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
  double _sidebarLeft = 0.0;
  bool _isOpen = true;

  @override
  Widget build(BuildContext context) {
    // Calculate sidebar width based on orientation.
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final double sidebarWidth =
        isLandscape
            ? MediaQuery.of(context).size.width * 0.4
            : MediaQuery.of(context).size.width * 0.7;

    return BlocBuilder<SidebarCubit, SidebarState>(
      builder: (context, state) {
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          // Use _sidebarLeft for horizontal offset (0 = open, negative = slid left)
          left: _sidebarLeft,
          top: isLandscape ? 160.h : (65 + 30).h,
          width: sidebarWidth,
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          child: GestureDetector(
            onHorizontalDragUpdate: (details) {
              setState(() {
                _sidebarLeft += details.delta.dx;
                // Constrain the sidebar offset between fully closed and open.
                if (_sidebarLeft > 0) _sidebarLeft = 0;
                if (_sidebarLeft < -sidebarWidth) _sidebarLeft = -sidebarWidth;
              });
            },
            onHorizontalDragEnd: (details) {
              setState(() {
                if (_sidebarLeft.abs() > sidebarWidth / 2) {
                  _sidebarLeft = -sidebarWidth;
                  _isOpen = false;
                } else {
                  _sidebarLeft = 0;
                  _isOpen = true;
                }
              });
              BlocProvider.of<SidebarCubit>(context).closeDrawer();
            },
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
                      height: isLandscape ? 200.h : 100.h,
                      child: Image.asset(AppImages.aimatrix),
                    ),
                    verticalSpace(22),
                    Text(
                      "MENU",
                      style: AppStyles.boldNoColor18.copyWith(
                        color: AppColors.grey400,
                        fontSize: isLandscape ? 10.sp : 14.sp,
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
          ),
        );
      },
    );
  }
}
