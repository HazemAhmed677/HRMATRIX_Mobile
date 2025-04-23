import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../data/models/sidebar_model.dart';

List<SidebarItemModel> getSidebarItems() => [
  SidebarItemModel(title: 'Home', icon: FontAwesomeIcons.house),
  SidebarItemModel(title: 'Calendar', icon: FontAwesomeIcons.calendarDays),
  SidebarItemModel(title: 'User Profile', icon: FontAwesomeIcons.user),
  SidebarItemModel(title: 'Employees', icon: FontAwesomeIcons.users),
  SidebarItemModel(title: 'Tasks', icon: FontAwesomeIcons.clipboardCheck),
  SidebarItemModel(title: 'Reports', icon: FontAwesomeIcons.chartColumn),
  SidebarItemModel(title: 'Mass Action', icon: FontAwesomeIcons.bolt),
  SidebarItemModel(title: 'Salary', icon: FontAwesomeIcons.moneyBillWave),
  SidebarItemModel(
    title: 'Requests',
    icon: FontAwesomeIcons.envelopeOpenText,
    children: [
      SidebarItemModel(title: 'Time Off', icon: FontAwesomeIcons.clock),
      SidebarItemModel(title: 'Over Time', icon: FontAwesomeIcons.businessTime),
      SidebarItemModel(title: 'Clock In', icon: FontAwesomeIcons.signInAlt),
      SidebarItemModel(title: 'Clock Out', icon: FontAwesomeIcons.signOutAlt),
      SidebarItemModel(title: 'Loans', icon: FontAwesomeIcons.handHoldingUsd),
      SidebarItemModel(
        title: 'Financial Transaction',
        icon: FontAwesomeIcons.fileInvoiceDollar,
      ),
      SidebarItemModel(title: 'Air Ticket', icon: FontAwesomeIcons.plane),
      SidebarItemModel(title: 'Vacation', icon: FontAwesomeIcons.umbrellaBeach),
      SidebarItemModel(title: 'Assets', icon: FontAwesomeIcons.boxOpen),
    ],
  ),
  SidebarItemModel(title: 'Approvals', icon: FontAwesomeIcons.thumbsUp),
  SidebarItemModel(title: 'Company Docs', icon: FontAwesomeIcons.folderOpen),
  SidebarItemModel(title: 'Commission', icon: FontAwesomeIcons.coins),
  SidebarItemModel(title: 'Hierarchical Tree', icon: FontAwesomeIcons.sitemap),
];
