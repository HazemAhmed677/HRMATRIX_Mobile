import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/core/typography/app_padding.dart';
import 'package:hrmatrix/layout/main_layout/helper.dart/build_content.dart';

import '../../core/theming/app_styles.dart';
import '../../core/typography/font_weight_helper.dart';
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
                Positioned.fill(
                  child: Column(
                    children: [
                      AppBar(
                        title: Text(
                          "HRMATRIX",
                          style: AppStyles.boldNoColor20.copyWith(
                            fontSize: 30.sp,
                            fontWeight: FontWeightHelper.extraBold,
                          ),
                        ),
                        flexibleSpace: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: AppColors.borderColor,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                        backgroundColor: AppColors.white,
                        leading: IconButton(
                          icon: Icon(
                            state.isDrawerOpen ? Icons.close : Icons.menu,
                            color: AppColors.fontPrimaryColor,
                          ),
                          onPressed:
                              () => context.read<SidebarCubit>().toggleDrawer(),
                        ),

                        centerTitle: true,
                      ),

                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            context.read<SidebarCubit>().closeDrawer();
                          },
                          child: AnimatedOpacity(
                            duration: Duration(milliseconds: 300),
                            opacity: state.isDrawerOpen ? 0.3 : 1.0,

                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppPadding.pMainHorizental22.w,
                                vertical: AppPadding.pMainVertical16,
                              ),
                              child: buildContent(state.selectedIndex),
                            ),
                          ),
                        ),
                      ),
                    ],
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
