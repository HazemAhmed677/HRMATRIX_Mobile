import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helpers/spacing.dart';
import 'package:hrmatrix/features/profile_pt1/logic/bar_ui/bar_ui_cubit.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/bar_item.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/helpers/get_all_categories.dart';

class BarListView extends StatefulWidget {
  const BarListView({super.key});

  @override
  State<BarListView> createState() => _BarListViewState();
}

class _BarListViewState extends State<BarListView> {
  final List<Map<String, dynamic>> categories = getAllCategories();
  final ScrollController _scrollController = ScrollController();
  double scrollProgress = 0.0;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients ||
        _scrollController.position.maxScrollExtent == 0)
      return;
    final progress =
        _scrollController.offset / _scrollController.position.maxScrollExtent;
    setState(() {
      scrollProgress = progress.clamp(0.0, 1.0);
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height:
              MediaQuery.of(context).orientation == Orientation.landscape
                  ? 240.h
                  : 110.h,
          child: ListView.separated(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final item = categories[index];
              return GestureDetector(
                onTap: () {
                  if (index != currentIndex) {
                    currentIndex = index;
                    setState(() {});
                    BlocProvider.of<BarUiCubit>(context).rebuild(index: index);
                  }
                },
                child: BarItem(item: item, isActive: currentIndex == index),
              );
            },
          ),
        ),
        verticalSpace(16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: LinearProgressIndicator(
              value: scrollProgress,
              minHeight: 5.h,
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.deepPurple,
              ), // vivid
            ),
          ),
        ),
      ],
    );
  }
}
