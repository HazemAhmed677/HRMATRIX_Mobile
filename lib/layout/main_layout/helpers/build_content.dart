import 'package:flutter/material.dart';

import '../../../features/hierarchical_tree/ui/widgets/hierarchical_tree.dart';
import '../../../features/home/ui/widgets/home_view_body.dart';

Widget buildContent(int index) {
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
    Center(child: HierarchicalTree()),
  ];
  return AnimatedSwitcher(
    duration: const Duration(milliseconds: 500),
    child: pages[index],
  );
}
