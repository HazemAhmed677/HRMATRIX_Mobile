import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helper/employee_model_helpers.dart';
import 'package:hrmatrix/features/profile_pt1/logic/get_my_loans/get_my_loans_cubit.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/common_container_profile.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/loading_widget.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/no_data_available.dart';

import '../../../../core/theming/app_color.dart';

class LoansTable extends StatefulWidget {
  const LoansTable({super.key});

  @override
  State<LoansTable> createState() => _LoansTableState();
}

class _LoansTableState extends State<LoansTable> {
  @override
  void initState() {
    BlocProvider.of<GetMyLoansCubit>(context).getMyLoans();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CommonContainerProfile(
      child: BlocBuilder<GetMyLoansCubit, GetMyLoansState>(
        builder: (context, state) {
          if (state is GetMyLoansLoading) {
            return LoadingWidget();
          } else if (state is GetMyLoansSuccess) {
            if (state.getMyLoansModel.count == 0) {
              return NoDataAvailable();
            } else {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Table(
                  columnWidths: const {
                    0: FlexColumnWidth(2),
                    1: FlexColumnWidth(2),
                    2: FlexColumnWidth(2),
                    3: FlexColumnWidth(2),
                    4: FlexColumnWidth(2),
                    5: FlexColumnWidth(2),
                    6: FlexColumnWidth(2),
                  },
                  border: TableBorder.symmetric(
                    inside: BorderSide(color: Colors.grey.shade300),
                  ),
                  children: [
                    // Header
                    TableRow(
                      decoration: BoxDecoration(color: Colors.grey.shade200),
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            'Type',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            'Term (Months)',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            'Effective Date',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            'Loan Amount',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            'Installments',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            'Number of Payments',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            'Status',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),

                    // Dummy Row
                    ...state.getMyLoansModel.loans!.map(
                      (e) => TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(e.type!),
                          ),
                          Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(e.term!.toString()),
                          ),
                          Padding(
                            padding: EdgeInsets.all(12),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                convertTimeStmpToDate(e.effectiveDate!),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(12),
                            child: Text('\$${e.amount!.toString()}'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(12),
                            child: Text('\$${e.installments!.toString()}'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(e.numberOfPayments!.toString()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                e.status!,
                                style: TextStyle(
                                  color: AppColors.grey800,
                                  fontSize: 6.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          } else if (state is GetMyLoansFailure) {
            return Center(child: Text(state.errorMsg));
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
