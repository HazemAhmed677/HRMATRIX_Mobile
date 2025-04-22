import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrmatrix/core/helpers/request_class.dart';
import 'package:hrmatrix/core/helpers/spacing.dart';
import 'package:hrmatrix/core/widgets/custom_search_text_field.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/common_container_profile.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/helpers/profile_common_dialog.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/profile_common_row.dart';
import 'package:hrmatrix/features/profile_pt2/data/models/get_my_requests_model/request.dart';
import 'package:hrmatrix/features/profile_pt2/logic/get_my_time_off/get_my_time_off_cubit.dart';
import 'package:hrmatrix/features/profile_pt2/ui/widgets/time_off_dialog.dart';
import 'package:hrmatrix/features/profile_pt2/ui/widgets/time_off_table.dart';

import '../../../profile_pt1/ui/widgets/loading_widget.dart';
import '../../../profile_pt1/ui/widgets/no_data_available.dart';

class TimeOffTableContainer extends StatefulWidget {
  const TimeOffTableContainer({super.key});

  @override
  State<TimeOffTableContainer> createState() => _TimeOffTableContainerState();
}

class _TimeOffTableContainerState extends State<TimeOffTableContainer> {
  @override
  void initState() {
    if (RequestClass.timeOffRequest == null) {
      BlocProvider.of<GetMyTimeOffCubit>(context).getMyTimeOff();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CommonContainerProfile(
      child: Column(
        children: [
          CustomSearchTextFeild(readOnly: false, hintText: 'Search...'),
          verticalSpace(28),
          if (MediaQuery.orientationOf(context) == Orientation.landscape)
            ProfileCommonRow(
              text: 'Add Time Off Request',
              onPressed: () {
                showProfileCommonDialog(
                  child: TimeOffDialog(),
                  context: context,
                );
              },
            ),
          verticalSpace(28),
          (RequestClass.timeOffRequest != null)
              ? (RequestClass.timeOffRequest!.isEmpty)
                  ? NoDataAvailable()
                  : TimeOffTable(timeOffRequests: RequestClass.timeOffRequest!)
              : BlocBuilder<GetMyTimeOffCubit, GetMyTimeOffState>(
                builder: (context, state) {
                  if (state is GetMyTimeOffLoading) {
                    return LoadingWidget();
                  } else if (state is GetMyTimeOffSuccess) {
                    if (state.getMyRequestsModel.data!.requests!.isEmpty) {
                      return NoDataAvailable();
                    } else {
                      if (RequestClass.vacationRequest == null) {
                        List<Request> vacations =
                            state.getMyRequestsModel.data!.requests!
                                .where(
                                  (element) =>
                                      element.type == 'Paid Vacation' ||
                                      element.type == 'Sick Vacation',
                                )
                                .toList();
                        RequestClass.vacationRequest = vacations;
                      }
                      if (RequestClass.overTimeRequest == null) {
                        List<Request> overTimes =
                            state.getMyRequestsModel.data!.requests!
                                .where((element) => element.type == 'Over Time')
                                .toList();
                        RequestClass.overTimeRequest = overTimes;
                      }
                      List<Request> data =
                          state.getMyRequestsModel.data!.requests!
                              .where((element) => element.type == 'Time Off')
                              .toList();
                      RequestClass.timeOffRequest = data;
                      if (data.isEmpty) {
                        return NoDataAvailable();
                      }
                      {
                        return TimeOffTable(timeOffRequests: data);
                      }
                    }
                  } else if (state is GetMyTimeOffFailure) {
                    return Text(state.errorMsg);
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),

          // Table Widget with the new columns
        ],
      ),
    );
  }
}
