import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/loading_widget.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/no_data_available.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/over_time_table.dart';

import '../../../profile_pt2/data/models/get_my_requests_model/request.dart';
import '../../../profile_pt2/logic/get_my_requests/get_my_requests_cubit.dart';

class OverTimeTableContainer extends StatefulWidget {
  const OverTimeTableContainer({super.key});

  @override
  State<OverTimeTableContainer> createState() => _OverTimeTableContainerState();
}

class _OverTimeTableContainerState extends State<OverTimeTableContainer> {
  @override
  void initState() {
    BlocProvider.of<GetMyRequestsCubit>(context).getMyRequests();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMyRequestsCubit, GetMyRequestsState>(
      builder: (context, state) {
        if (state is GetMyRequestsLoading) {
          return LoadingWidget();
        } else if (state is GetMyRequestsSuccess) {
          List<Request> data =
              state.getMyRequestsModel.data!.requests!
                  .where((element) => element.type == 'Over Time')
                  .toList();
          if (data.isEmpty) {
            return NoDataAvailable();
          }
          {
            return OverTimeTable(overTimeRequests: data);
          }
        } else if (state is GetMyRequestsFailure) {
          return Text(state.errorMsg);
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
