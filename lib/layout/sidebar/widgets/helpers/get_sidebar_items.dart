import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hrmatrix/layout/sidebar/widgets/helpers/sub_items_lists.dart';
import 'package:hrmatrix/main.dart';

import '../../../../core/helpers/sidebar_titles.dart';
import '../../data/models/sidebar_model.dart';

List<SidebarItemModel> getSidebarItems() => [
  SidebarItemModel(title: SidebarTitles.home, icon: FontAwesomeIcons.house),
  SidebarItemModel(
    title: SidebarTitles.userProfile,
    icon: FontAwesomeIcons.user,
  ),
  SidebarItemModel(
    title: SidebarTitles.calendar,
    icon: FontAwesomeIcons.calendarDays,
  ),

  SidebarItemModel(
    title: SidebarTitles.employees,
    icon: FontAwesomeIcons.users,
    subItems: getEmployeesSubItems(),
  ),
  SidebarItemModel(
    title: SidebarTitles.tasks,
    icon: FontAwesomeIcons.clipboardCheck,
  ),
  if (employeeModel!.role != 'Member')
    SidebarItemModel(
      title: SidebarTitles.reports,
      icon: FontAwesomeIcons.chartColumn,
      subItems: getReportsSubItems(),
    ),
  if (employeeModel!.role != 'Member')
    SidebarItemModel(
      title: SidebarTitles.massAction,
      icon: FontAwesomeIcons.bolt,
      subItems: getMassActionsSubItems(),
    ),
  SidebarItemModel(
    title: SidebarTitles.salary,
    icon: FontAwesomeIcons.moneyBillWave,
    subItems: getSalarySubItems(),
  ),
  if (employeeModel!.role != 'Super Admin')
    SidebarItemModel(
      title: SidebarTitles.requests,
      icon: FontAwesomeIcons.envelopeOpenText,
      subItems: getRequestsSubItems(),
    ),

  if (employeeModel!.role != 'Member')
    SidebarItemModel(
      title: SidebarTitles.approvals,
      icon: FontAwesomeIcons.thumbsUp,
      subItems: getApprovalsSubItems(),
    ),
  SidebarItemModel(
    title: SidebarTitles.companyDocs,
    icon: FontAwesomeIcons.folderOpen,
  ),
  if (employeeModel!.role != 'Member' && employeeModel!.role != 'Super Admin')
    SidebarItemModel(
      title: SidebarTitles.commission,
      icon: FontAwesomeIcons.coins,
    ),
  SidebarItemModel(
    title: SidebarTitles.hierarchicalTree,
    icon: FontAwesomeIcons.sitemap,
  ),
];
