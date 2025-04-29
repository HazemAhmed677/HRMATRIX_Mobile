import '../../../../core/helpers/sidebar_titles.dart';
import '../../data/models/sidebar_model.dart';

List<SidebarItemModel> getEmployeesSubItems() => [
  SidebarItemModel(title: SidebarTitles.employees),
  SidebarItemModel(title: SidebarTitles.attendances),
  SidebarItemModel(title: SidebarTitles.departments),
  SidebarItemModel(title: SidebarTitles.employeesRank),
  SidebarItemModel(title: SidebarTitles.employeesRecommendations),
  SidebarItemModel(title: SidebarTitles.feedbacks),
  SidebarItemModel(title: SidebarTitles.employeesShifts),
];

List<SidebarItemModel> getRequestsSubItems() => [
  SidebarItemModel(title: SidebarTitles.timeOff),
  SidebarItemModel(title: SidebarTitles.overTime),
  SidebarItemModel(title: SidebarTitles.clockIn),
  SidebarItemModel(title: SidebarTitles.clockOut),
  SidebarItemModel(title: SidebarTitles.loans),
  SidebarItemModel(title: SidebarTitles.financialTransaction),
  SidebarItemModel(title: SidebarTitles.airTicket),
  SidebarItemModel(title: SidebarTitles.vacation),
  SidebarItemModel(title: SidebarTitles.assets),
];

List<SidebarItemModel> getApprovalsSubItems() => [
  SidebarItemModel(title: SidebarTitles.timeOff),
  SidebarItemModel(title: SidebarTitles.overTime),
  SidebarItemModel(title: SidebarTitles.geoInOut),
  SidebarItemModel(title: SidebarTitles.loans),
  SidebarItemModel(title: SidebarTitles.financialTransaction),
  SidebarItemModel(title: SidebarTitles.airTicket),
  SidebarItemModel(title: SidebarTitles.vacation),
  SidebarItemModel(title: SidebarTitles.assets),
];

List<SidebarItemModel> getSalarySubItems() => [
  SidebarItemModel(title: SidebarTitles.salary),
  SidebarItemModel(title: SidebarTitles.salaryPatches),
];

List<SidebarItemModel> getReportsSubItems() => [
  SidebarItemModel(title: SidebarTitles.reportTable),
  SidebarItemModel(title: SidebarTitles.buildReport),
];

List<SidebarItemModel> getMassActionsSubItems() => [
  SidebarItemModel(title: SidebarTitles.history),
  SidebarItemModel(title: SidebarTitles.create),
];
