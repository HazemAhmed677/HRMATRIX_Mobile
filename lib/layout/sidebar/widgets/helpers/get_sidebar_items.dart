import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/helpers/sidebar_titles.dart';
import '../../data/models/sidebar_model.dart';

List<SidebarItemModel> getSidebarItems() => [
  SidebarItemModel(title: SidebarTitles.home, icon: FontAwesomeIcons.house),
  SidebarItemModel(
    title: SidebarTitles.calendar,
    icon: FontAwesomeIcons.calendarDays,
  ),
  SidebarItemModel(
    title: SidebarTitles.userProfile,
    icon: FontAwesomeIcons.user,
  ),
  SidebarItemModel(
    title: SidebarTitles.employees,
    icon: FontAwesomeIcons.users,
  ),
  SidebarItemModel(
    title: SidebarTitles.tasks,
    icon: FontAwesomeIcons.clipboardCheck,
  ),
  SidebarItemModel(
    title: SidebarTitles.reports,
    icon: FontAwesomeIcons.chartColumn,
  ),
  SidebarItemModel(
    title: SidebarTitles.massAction,
    icon: FontAwesomeIcons.bolt,
  ),
  SidebarItemModel(
    title: SidebarTitles.salary,
    icon: FontAwesomeIcons.moneyBillWave,
  ),
  SidebarItemModel(
    title: SidebarTitles.requests,
    icon: FontAwesomeIcons.envelopeOpenText,
    subItems: [
      SidebarItemModel(
        title: SidebarTitles.timeOff,
        icon: FontAwesomeIcons.clock,
      ),
      SidebarItemModel(
        title: SidebarTitles.overTime,
        icon: FontAwesomeIcons.businessTime,
      ),
      SidebarItemModel(
        title: SidebarTitles.clockIn,
        icon: FontAwesomeIcons.rightToBracket,
      ),
      SidebarItemModel(
        title: SidebarTitles.clockOut,
        icon: FontAwesomeIcons.rightFromBracket,
      ),
      SidebarItemModel(
        title: SidebarTitles.loans,
        icon: FontAwesomeIcons.handHoldingDollar,
      ),
      SidebarItemModel(
        title: SidebarTitles.financialTransaction,
        icon: FontAwesomeIcons.fileInvoiceDollar,
      ),
      SidebarItemModel(
        title: SidebarTitles.airTicket,
        icon: FontAwesomeIcons.plane,
      ),
      SidebarItemModel(
        title: SidebarTitles.vacation,
        icon: FontAwesomeIcons.umbrellaBeach,
      ),
      SidebarItemModel(
        title: SidebarTitles.assets,
        icon: FontAwesomeIcons.boxOpen,
      ),
    ],
  ),
  SidebarItemModel(
    title: SidebarTitles.approvals,
    icon: FontAwesomeIcons.thumbsUp,
  ),
  SidebarItemModel(
    title: SidebarTitles.companyDocs,
    icon: FontAwesomeIcons.folderOpen,
  ),
  SidebarItemModel(
    title: SidebarTitles.commission,
    icon: FontAwesomeIcons.coins,
  ),
  SidebarItemModel(
    title: SidebarTitles.hierarchicalTree,
    icon: FontAwesomeIcons.sitemap,
  ),
];
