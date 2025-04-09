import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/core/typography/app_padding.dart';
import 'package:hrmatrix/layout/main_layout/helpers/build_content.dart';
import 'package:hrmatrix/layout/main_layout/helpers/custom_app_bar.dart';

import '../sidebar/logic/sidebar_cubit.dart';
import '../sidebar/logic/sidebar_state.dart';
import '../sidebar/sidebar.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SidebarCubit(),
      child: BlocBuilder<SidebarCubit, SidebarState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: Stack(
              children: [
                // Main content
                Column(
                  children: [
                    customAppBar(context, state),
                    Expanded(
                      child: AbsorbPointer(
                        absorbing: state.isDrawerOpen,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppPadding.pMainHorizental22.w,
                            vertical: AppPadding.pMainVertical16,
                          ),
                          child: buildContent(state.selectedIndex),
                        ),
                      ),
                    ),
                  ],
                ),
                if (state.isDrawerOpen)
                  Positioned(
                    top: (65 + 30).h,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        context.read<SidebarCubit>().closeDrawer();
                      },
                      child: Container(
                        color: AppColors.grey500.withValues(
                          alpha: 0.5,
                        ), // or Colors.grey.shade800
                      ),
                    ),
                  ),
                if (state.isDrawerOpen) Sidebar(),
              ],
            ),
          );
        },
      ),
    );
  }
}
