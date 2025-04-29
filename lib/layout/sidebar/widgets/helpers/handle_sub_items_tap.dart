import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/sidebar_titles.dart';
import '../../../../features/profile_pt1/ui/widgets/over_time_dialog_widget.dart';
import '../../../../features/profile_pt2/ui/widgets/time_off_dialog.dart';
import '../../../../features/requests/ui/widgets/helpers/profile_common_dialog.dart';
import '../../logic/sidebar_cubit.dart';

void handleRequestsSubItemsTap({
  required String title,
  required int parentIndex,
  required int subIndex,
  required BuildContext context,
}) {
  context.read<SidebarCubit>().selectSubItem(parentIndex, subIndex);
  switch (title) {
    case SidebarTitles.timeOff:
      showProfileCommonDialog(child: TimeOffDialog(), context: context);
      break;
    case SidebarTitles.overTime:
      showProfileCommonDialog(child: OverTimeDialogWidget(), context: context);
  }
}
