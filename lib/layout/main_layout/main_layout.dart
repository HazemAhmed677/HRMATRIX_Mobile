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

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late final AnimationController _appBarController;
  late final Animation<double> _appBarAnimation;
  double _lastOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);

    _appBarController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _appBarAnimation = CurvedAnimation(
      parent: _appBarController,
      curve: Curves.easeInOut,
    );

    _appBarController.value = 1.0;
  }

  void _scrollListener() {
    final cubit = context.read<SidebarCubit>();
    final currentOffset = _scrollController.offset;

    if (currentOffset > _lastOffset) {
      cubit.updateAppBarVisibility(false);
      _appBarController.reverse();
    } else if (currentOffset < _lastOffset) {
      cubit.updateAppBarVisibility(true);
      _appBarController.forward();
    }

    _lastOffset = currentOffset;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _appBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SidebarCubit, SidebarState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: Stack(
            children: [
              Column(
                children: [
                  ClipRect(
                    child: SizeTransition(
                      sizeFactor: _appBarAnimation,
                      axisAlignment: -1.0,
                      child: customAppBar(context, state),
                    ),
                  ),
                  Expanded(
                    child: AbsorbPointer(
                      absorbing: state.isDrawerOpen,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppPadding.pMainHorizental22.w,
                          vertical: AppPadding.pMainVertical16,
                        ),
                        // here
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          child: buildContent(state.selectedIndex),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (state.isDrawerOpen)
                Positioned(
                  top:
                      MediaQuery.orientationOf(context) == Orientation.landscape
                          ? kToolbarHeight + MediaQuery.paddingOf(context).top
                          : (65 + 30).h,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () => context.read<SidebarCubit>().closeDrawer(),
                    child: Container(color: AppColors.grey500.withAlpha(100)),
                  ),
                ),
              if (state.isDrawerOpen) const Sidebar(),
            ],
          ),
        );
      },
    );
  }
}
