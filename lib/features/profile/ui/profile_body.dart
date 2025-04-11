import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrmatrix/core/helper/spacing.dart';
import 'package:hrmatrix/features/profile/logic/cubit/bar_ui_cubit.dart';
import 'package:hrmatrix/features/profile/ui/widgets/air_tickets_ui.dart';
import 'package:hrmatrix/features/profile/ui/widgets/assets_ui.dart';
import 'package:hrmatrix/features/profile/ui/widgets/bank_account_ui.dart';
import 'package:hrmatrix/features/profile/ui/widgets/bar_list_view.dart';
import 'package:hrmatrix/features/profile/ui/widgets/contracts_ui.dart';
import 'package:hrmatrix/features/profile/ui/widgets/disciplinary_actions_ui.dart';
import 'package:hrmatrix/features/profile/ui/widgets/documents_ui.dart';
import 'package:hrmatrix/features/profile/ui/widgets/family_info_ui.dart';
import 'package:hrmatrix/features/profile/ui/widgets/financial_transaction_ui.dart';
import 'package:hrmatrix/features/profile/ui/widgets/loans_ui.dart';
import 'package:hrmatrix/features/profile/ui/widgets/off_boarding_ui.dart';
import 'package:hrmatrix/features/profile/ui/widgets/on_boarding_ui.dart';
import 'package:hrmatrix/features/profile/ui/widgets/over_time_ui.dart';
import 'package:hrmatrix/features/profile/ui/widgets/part_time_ui.dart';
import 'package:hrmatrix/features/profile/ui/widgets/profile_ui.dart';
import 'package:hrmatrix/features/profile/ui/widgets/time_off_ui.dart';

import 'widgets/swipe_to_explore.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SwipeToExplore(),
            verticalSpace(12),
            BarListView(),
            verticalSpace(18),
            BlocBuilder<BarUiCubit, BarUiState>(
              builder: (context, state) {
                if (state is BankAccountState) {
                  if (MediaQuery.of(context).orientation ==
                      Orientation.landscape) {
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.portraitUp,
                      DeviceOrientation.portraitDown,
                    ]);
                  }
                  return BankAccountUI();
                } else if (state is FamilyInfoState) {
                  if (MediaQuery.of(context).orientation !=
                      Orientation.landscape) {
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.landscapeLeft,
                      DeviceOrientation.landscapeRight,
                    ]);
                  }
                  return FamilyInfoUI();
                } else if (state is DocumentsState) {
                  if (MediaQuery.of(context).orientation !=
                      Orientation.landscape) {
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.landscapeLeft,
                      DeviceOrientation.landscapeRight,
                    ]);
                  }
                  return DocumentsUI();
                } else if (state is LoansState) {
                  if (MediaQuery.of(context).orientation !=
                      Orientation.landscape) {
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.landscapeLeft,
                      DeviceOrientation.landscapeRight,
                    ]);
                  }
                  return LoansUI();
                } else if (state is OverTimeState) {
                  if (MediaQuery.of(context).orientation !=
                      Orientation.landscape) {
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.landscapeLeft,
                      DeviceOrientation.landscapeRight,
                    ]);
                  }
                  return OverTimeUI();
                } else if (state is AssetsState) {
                  if (MediaQuery.of(context).orientation !=
                      Orientation.landscape) {
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.landscapeLeft,
                      DeviceOrientation.landscapeRight,
                    ]);
                  }
                  return AssetsUI();
                } else if (state is AirTicketsState) {
                  if (MediaQuery.of(context).orientation !=
                      Orientation.landscape) {
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.landscapeLeft,
                      DeviceOrientation.landscapeRight,
                    ]);
                  }
                  return AirTicketsUI();
                } else if (state is FinancialTransactionState) {
                  if (MediaQuery.of(context).orientation !=
                      Orientation.landscape) {
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.landscapeLeft,
                      DeviceOrientation.landscapeRight,
                    ]);
                  }
                  return FinancialTransactionUI();
                } else if (state is TimeOffState) {
                  if (MediaQuery.of(context).orientation !=
                      Orientation.landscape) {
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.landscapeLeft,
                      DeviceOrientation.landscapeRight,
                    ]);
                  }
                  return TimeOffUI();
                } else if (state is PartTimeState) {
                  if (MediaQuery.of(context).orientation !=
                      Orientation.landscape) {
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.landscapeLeft,
                      DeviceOrientation.landscapeRight,
                    ]);
                  }
                  return PartTimeUI();
                } else if (state is DisciplinaryActionsState) {
                  if (MediaQuery.of(context).orientation !=
                      Orientation.landscape) {
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.landscapeLeft,
                      DeviceOrientation.landscapeRight,
                    ]);
                  }
                  return DisciplinaryActionsUI();
                } else if (state is ContractsState) {
                  if (MediaQuery.of(context).orientation !=
                      Orientation.landscape) {
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.landscapeLeft,
                      DeviceOrientation.landscapeRight,
                    ]);
                  }
                  return ContractsUI();
                } else if (state is OnBoardingState) {
                  if (MediaQuery.of(context).orientation ==
                      Orientation.landscape) {
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.portraitUp,
                      DeviceOrientation.portraitDown,
                    ]);
                  }
                  return OnBoardingUI();
                } else if (state is OffBoardingState) {
                  if (MediaQuery.of(context).orientation ==
                      Orientation.landscape) {
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.portraitUp,
                      DeviceOrientation.portraitDown,
                    ]);
                  }
                  return OffBoardingUI();
                }
                if (MediaQuery.of(context).orientation ==
                    Orientation.landscape) {
                  SystemChrome.setPreferredOrientations([
                    DeviceOrientation.portraitUp,
                    DeviceOrientation.portraitDown,
                  ]);
                }
                return ProfileUI();
              },
            ),
          ],
        ),
      ),
    );
  }
}
