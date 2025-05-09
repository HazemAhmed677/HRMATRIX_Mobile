import 'package:flutter/widgets.dart';

class SidebarItemModel {
  final String title;
  final IconData? icon;
  final List<SidebarItemModel>? subItems;
  SidebarItemModel({required this.title, this.icon, this.subItems});
}
