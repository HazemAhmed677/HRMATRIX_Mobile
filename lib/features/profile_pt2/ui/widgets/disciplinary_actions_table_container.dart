import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/common_container_profile.dart';
import 'package:hrmatrix/features/profile_pt2/logic/get_my_disciplinary_actions/get_my_disciplinary_actions_cubit.dart';

import '../../../profile_pt1/ui/widgets/loading_widget.dart';
import '../../../profile_pt1/ui/widgets/no_data_available.dart';
import 'disciplinary_actions_table.dart';

class DisciplinaryActionsTableContainer extends StatefulWidget {
  const DisciplinaryActionsTableContainer({super.key});

  @override
  State<DisciplinaryActionsTableContainer> createState() =>
      _DisciplinaryActionsTableContainerState();
}

class _DisciplinaryActionsTableContainerState
    extends State<DisciplinaryActionsTableContainer> {
  @override
  void initState() {
    BlocProvider.of<GetMyDisciplinaryActionsCubit>(
      context,
    ).getMyDisciplinaryActions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      GetMyDisciplinaryActionsCubit,
      GetMyDisciplinaryActionsState
    >(
      builder: (context, state) {
        if (state is GetMyDisciplinaryActionsLoading) {
          return LoadingWidget();
        } else if (state is GetMyDisciplinaryActionsSuccess) {
          if (state.getMyDisciplinaryActionsList.isEmpty) {
            return CommonContainerProfile(child: NoDataAvailable());
          }
          return DisciplinaryActionsTable(
            getMyDisciplinaryActions: state.getMyDisciplinaryActionsList,
          );
        } else if (state is GetMyDisciplinaryActionsFailure) {
          return Text(state.errorMsg);
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
