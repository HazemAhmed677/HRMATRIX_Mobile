import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrmatrix/core/helpers/spacing.dart';
import 'package:hrmatrix/core/widgets/custom_search_text_field.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/common_container_profile.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/no_data_available.dart';
import 'package:hrmatrix/features/profile_pt2/logic/get_my_air_tickets/get_my_air_tickets_cubit.dart';
import 'package:hrmatrix/features/profile_pt2/ui/widgets/air_ticket_table.dart';
import 'package:hrmatrix/features/profile_pt2/ui/widgets/air_tickets_request_dialog.dart';
import 'package:hrmatrix/features/requests/ui/widgets/helpers/profile_common_dialog.dart';

import '../../../profile_pt1/ui/widgets/loading_widget.dart';
import '../../../profile_pt1/ui/widgets/profile_common_row.dart';

class AirTicketsTableContainer extends StatefulWidget {
  const AirTicketsTableContainer({super.key});

  @override
  State<AirTicketsTableContainer> createState() =>
      _AirTicketsTableContainerState();
}

class _AirTicketsTableContainerState extends State<AirTicketsTableContainer> {
  @override
  void initState() {
    BlocProvider.of<GetMyAirTicketsCubit>(context).getMyAirTickets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CommonContainerProfile(
      child: Column(
        children: [
          CustomSearchTextFeild(
            readOnly: false,
            hintText: 'Search air tickets...',
          ),
          verticalSpace(28),
          if (MediaQuery.orientationOf(context) == Orientation.landscape)
            ProfileCommonRow(
              text: 'Request Air Ticket',
              onPressed: () {
                showProfileCommonDialog(
                  child: AirTicketsRequestDialog(),
                  context: context,
                );
              },
            ),
          verticalSpace(28),
          BlocBuilder<GetMyAirTicketsCubit, GetMyAirTicketsState>(
            builder: (context, state) {
              if (state is GetMyAirTicketsLoading) {
                return LoadingWidget();
              } else if (state is GetMyAirTicketsSuccess) {
                if (state.getMyAirTicketsModel.transactions!.isEmpty) {
                  return NoDataAvailable();
                } else {
                  return AirTicketTable(
                    getMyAirTicketsModel: state.getMyAirTicketsModel,
                  );
                }
              } else if (state is GetMyAirTicketsFailure) {
                return Text(state.errorMsg);
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
