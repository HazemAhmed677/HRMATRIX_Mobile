import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/common_container_profile.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/loading_widget.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/no_data_available.dart';
import 'package:hrmatrix/features/profile_pt2/logic/get_my_contracts/get_my_contracts_cubit.dart';
import 'package:hrmatrix/features/profile_pt2/ui/widgets/contracts_table.dart';

import '../../logic/get_my_contracts/get_my_contracts_state.dart';

class ContractsTableContainer extends StatefulWidget {
  const ContractsTableContainer({super.key});

  @override
  State<ContractsTableContainer> createState() =>
      _ContractsTableContainerState();
}

class _ContractsTableContainerState extends State<ContractsTableContainer> {
  @override
  void initState() {
    BlocProvider.of<GetMyContractsCubit>(context).getMyContracts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMyContractsCubit, GetMyContractsState>(
      builder: (context, state) {
        if (state is GetMyContractsLoading) {
          return LoadingWidget();
        } else if (state is GetMyContractsSuccess) {
          if (state.getMyContractsModel.data!.contracts!.isEmpty) {
            return NoDataAvailable();
          } else {
            return ContractsTable(
              getMyContractsModel: state.getMyContractsModel,
            );
          }
        } else if (state is GetMyContractsFailure) {
          return CommonContainerProfile(
            child: Center(child: Text(state.errorMsg)),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
