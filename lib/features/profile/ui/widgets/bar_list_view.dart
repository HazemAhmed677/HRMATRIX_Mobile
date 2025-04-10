import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/features/profile/ui/widgets/bar_item.dart';
import 'package:hrmatrix/features/profile/ui/widgets/helpers/get_all_categories.dart';

class BarListView extends StatefulWidget {
  const BarListView({super.key});

  @override
  State<BarListView> createState() => _BarListViewState();
}

class _BarListViewState extends State<BarListView> {
  final List<Map<String, dynamic>> categories = getAllCategories();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      clipBehavior: Clip.none,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final item = categories[index];
          return GestureDetector(
            onTap: () {
              // Handle tap
              currentIndex = index;
              setState(() {});
            },
            child: BarItem(item: item, isActive: currentIndex == index),
          );
        },
      ),
    );
  }
}
