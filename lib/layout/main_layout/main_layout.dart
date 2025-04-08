import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/core/typography/app_padding.dart';

import '../../core/theming/app_styles.dart';
import '../../features/home/ui/widgets/home_view_body.dart';
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
                          icon: Icon(Icons.menu),
                          onPressed:
                              () => context.read<SidebarCubit>().toggleDrawer(),
                        ),
                        centerTitle: true,
                      ),

                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppPadding.pMainHorizental22.w,
                            vertical: AppPadding.pMainVertical16,
                          ),
                          child: _buildContent(state.selectedIndex),
                        ),
                      ),
                    ],
                  ),
                ),

                // Sidebar (Drawer)
                Sidebar(),

                // Background overlay when drawer is open
                if (state.isDrawerOpen)
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: () => context.read<SidebarCubit>().closeDrawer(),
                      child: Container(color: Colors.black.withOpacity(0.4)),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent(int index) {
    List<Widget> pages = [
      HomeViewBody(),
      Center(child: Text("Calendar Page")),
      Center(child: Text("User Profile Page")),
      Center(child: Text("Employees Page")),
      Center(child: Text("Tasks Page")),
      Center(child: Text("Reports Page")),
      Center(child: Text("Mass Action Page")),
      Center(child: Text("Salary Page")),
      Center(child: Text("Requests Page")),
      Center(child: Text("Approvals Page")),
      Center(child: Text("Company Docs Page")),
      Center(child: Text("Commission Page")),
      Center(child: Text("Hierarchical Tree Page")),
    ];

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: pages[index],
    );
  }
}
