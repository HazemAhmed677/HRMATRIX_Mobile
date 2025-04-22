import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrmatrix/core/helpers/spacing.dart';
import 'package:hrmatrix/core/widgets/custom_search_text_field.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/common_container_profile.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/helpers/profile_common_dialog.dart';
import 'package:hrmatrix/features/profile_pt2/logic/get_my_financial_transaction/get_my_financial_transaction_cubit.dart';
import 'package:hrmatrix/features/profile_pt2/ui/widgets/financial_transaction_dialog.dart';
import 'package:hrmatrix/features/profile_pt2/ui/widgets/financial_transaction_table.dart';

import '../../../profile_pt1/ui/widgets/loading_widget.dart';
import '../../../profile_pt1/ui/widgets/no_data_available.dart';
import '../../../profile_pt1/ui/widgets/profile_common_row.dart';

class FinancialTransactionTableContainer extends StatefulWidget {
  const FinancialTransactionTableContainer({super.key});

  @override
  State<FinancialTransactionTableContainer> createState() =>
      _FinancialTransactionTableContainerState();
}

class _FinancialTransactionTableContainerState
    extends State<FinancialTransactionTableContainer> {
  @override
  void initState() {
    BlocProvider.of<GetMyFinancialTransactionCubit>(
      context,
    ).getMyFinancialTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CommonContainerProfile(
      child: Column(
        children: [
          // Search & Save As Bar
          CustomSearchTextFeild(
            readOnly: false,
            hintText: 'Search air tickets...',
          ),
          verticalSpace(28),
          ProfileCommonRow(
            text: 'Request',
            onPressed: () {
              showProfileCommonDialog(
                child: FinancialTransactionDialog(),
                context: context,
              );
            },
          ),
          verticalSpace(28),
          BlocBuilder<
            GetMyFinancialTransactionCubit,
            GetMyFinancialTransactionState
          >(
            builder: (context, state) {
              if (state is GetMyFinancialTransactionLoading) {
                return LoadingWidget();
              } else if (state is GetMyFinancialTransactionSuccess) {
                if (state
                    .getMyFinancialTransactionModel
                    .myApprovedFinancialTransaction!
                    .isEmpty) {
                  return NoDataAvailable();
                } else {
                  return FinancialTransactionTable(
                    getMyFinancialTransactionModel:
                        state.getMyFinancialTransactionModel,
                  );
                }
              } else if (state is GetMyFinancialTransactionFailure) {
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
