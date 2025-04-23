import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helpers/spacing.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/core/theming/app_styles.dart';
import 'package:hrmatrix/core/typography/app_images.dart';
import 'package:hrmatrix/core/typography/app_padding.dart';
import 'package:hrmatrix/layout/sidebar/data/models/sidebar_model.dart';
import 'package:hrmatrix/layout/sidebar/logic/sidebar_cubit.dart';
import 'package:hrmatrix/layout/sidebar/logic/sidebar_state.dart';
import 'package:hrmatrix/layout/sidebar/widgets/helpers/get_headlins.dart';
import 'package:hrmatrix/layout/sidebar/widgets/sidebar_item.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  double _sidebarLeft = 0.0;

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final sidebarWidth =
        isLandscape
            ? MediaQuery.of(context).size.width * 0.4
            : MediaQuery.of(context).size.width * 0.7;

    return BlocBuilder<SidebarCubit, SidebarState>(
      builder: (context, state) {
        List<SidebarItemModel> items = getSidebarItems();

        List<Widget> buildMenu(
          List<SidebarItemModel> models, {
          int indent = 0,
        }) {
          return models.expand((item) {
            final isExpanded = state.expandedTitles.contains(item.title);
            final hasChildren = item.children?.isNotEmpty ?? false;
            return [
              Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: SidebarItem(
                  title: item.title,
                  iconData: item.icon,
                  onTap: () {
                    if (hasChildren) {
                      context.read<SidebarCubit>().toggleExpand(item.title);
                    } else {
                      context.read<SidebarCubit>().selectIndex(
                        items.indexOf(item),
                      );
                    }
                  },
                  isActive: state.selectedIndex == items.indexOf(item),
                  indent: indent,
                  isExpandable: hasChildren,
                  isExpanded: isExpanded,
                ),
              ),
              if (hasChildren && isExpanded)
                ...buildMenu(item.children!, indent: indent + 1),
            ];
          }).toList();
        }

        return AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          left: _sidebarLeft,
          top: MediaQuery.of(context).padding.top + kToolbarHeight,
          width: sidebarWidth,
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          child: GestureDetector(
            onHorizontalDragUpdate: (details) {
              setState(() {
                _sidebarLeft += details.delta.dx;
                if (_sidebarLeft > 0) _sidebarLeft = 0;
                if (_sidebarLeft < -sidebarWidth) _sidebarLeft = -sidebarWidth;
              });
            },
            onHorizontalDragEnd: (details) {
              setState(() {
                _sidebarLeft =
                    _sidebarLeft.abs() > sidebarWidth / 2 ? -sidebarWidth : 0;
              });
              context.read<SidebarCubit>().closeDrawer();
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.borderColor),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: AppPadding.pMainHorizental22.w,
                  right: 10.w,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      isLandscape ? verticalSpace(35) : verticalSpace(12),
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
                        ),
                      ),
                      verticalSpace(12),
                      ...buildMenu(items),
                      (isLandscape) ? verticalSpace(85) : verticalSpace(45),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
