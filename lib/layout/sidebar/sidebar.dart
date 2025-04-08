import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/layout/sidebar/logic/sidebar_cubit.dart';
import 'package:hrmatrix/layout/sidebar/logic/sidebar_state.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  final List<String> items = [
    'Home',
    'Calendar',
    'User Profile',
    'Employees',
    'Tasks',
    'Reports',
    'Mass Action',
    'Salary',
    'Requests',
    'Approvals',
    'Company Docs',
    'Commission',
    'Hierarchical Tree',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SidebarCubit, SidebarState>(
      builder: (context, state) {
        return AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          left: state.isDrawerOpen ? 0 : -250,
          top: 0,
          bottom: 0,
          child: SizedBox(
            width: 250,
            child: Material(
              color: Colors.blueGrey.shade800,
              child: Column(
                children: [
                  Container(
                    height: 80,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      "Menu",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final selected = state.selectedIndex == index;
                        return ListTile(
                          selected: selected,
                          leading: Icon(
                            Icons.circle,
                            color: Colors.white,
                            size: 20,
                          ),
                          title: Text(
                            items[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight:
                                  selected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                          ),
                          onTap:
                              () => context.read<SidebarCubit>().selectIndex(
                                index,
                              ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
