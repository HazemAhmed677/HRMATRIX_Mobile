import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/app_color.dart';
import '../../../core/theming/app_styles.dart';
import '../../../core/typography/font_weight_helper.dart';
import '../../sidebar/logic/sidebar_cubit.dart';
import '../../sidebar/logic/sidebar_state.dart';
import '../widgets/custom_pop_up_menu.dart';

PreferredSizeWidget customAppBar(BuildContext context, SidebarState state) {
  final bool isLandscape =
      MediaQuery.of(context).orientation == Orientation.landscape;

  return AppBar(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: AppColors.white,
    centerTitle: true,
    toolbarHeight: isLandscape ? 90.h : null, // also apply height here
    title: Text(
      "HRMATRIX",
      style: AppStyles.boldNoColor20.copyWith(
        fontSize: isLandscape ? 20.sp : 30.sp,
        fontWeight: FontWeightHelper.extraBold,
      ),
    ),
    flexibleSpace: Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.borderColor, width: 1.0),
        ),
      ),
    ),
    leading: IconButton(
      icon: Icon(
        state.isDrawerOpen ? Icons.close : Icons.menu,
        color: AppColors.fontPrimaryColor,
      ),
      onPressed: () => context.read<SidebarCubit>().toggleDrawer(),
    ),
    actions: [CustomPopUpMenu()],
  );
}
