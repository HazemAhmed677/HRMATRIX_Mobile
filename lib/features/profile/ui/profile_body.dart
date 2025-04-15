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
  void _setOrientation({required bool landscape}) {
    final orientations =
        landscape
            ? [
              DeviceOrientation.landscapeLeft,
              DeviceOrientation.landscapeRight,
            ]
            : [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown];

    SystemChrome.setPreferredOrientations(orientations);
  }

  Widget _buildSelectedSection(BarUiState state) {
    final landscapeStates = {
      FamilyInfoState,
      DocumentsState,
      LoansState,
      OverTimeState,
      AssetsState,
      AirTicketsState,
      FinancialTransactionState,
      TimeOffState,
      PartTimeState,
      DisciplinaryActionsState,
      ContractsState,
    };

    final portraitStates = {
      BankAccountState,
      OnBoardingState,
      OffBoardingState,
    };

    if (landscapeStates.contains(state.runtimeType)) {
      if (MediaQuery.of(context).orientation != Orientation.landscape) {
        _setOrientation(landscape: true);
      }
    } else if (portraitStates.contains(state.runtimeType)) {
      if (MediaQuery.of(context).orientation == Orientation.landscape) {
        _setOrientation(landscape: false);
      }
    } else {
      if (MediaQuery.of(context).orientation == Orientation.landscape) {
        _setOrientation(landscape: false);
      }
    }

    final widgetMap = <Type, Widget Function()>{
      BankAccountState: () => BankAccountUI(),
      FamilyInfoState: () => FamilyInfoUI(),
      DocumentsState: () => DocumentsUI(),
      LoansState: () => LoansUI(),
      OverTimeState: () => OverTimeUI(),
      AssetsState: () => AssetsUI(),
      AirTicketsState: () => AirTicketsUI(),
      FinancialTransactionState: () => FinancialTransactionUI(),
      TimeOffState: () => TimeOffUI(),
      PartTimeState: () => PartTimeUI(),
      DisciplinaryActionsState: () => DisciplinaryActionsUI(),
      ContractsState: () => ContractsUI(),
      OnBoardingState: () => OnBoardingUI(),
      OffBoardingState: () => OffBoardingUI(),
    };

    return widgetMap[state.runtimeType]?.call() ?? const ProfileUI();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        children: [
          SwipeToExplore(),
          verticalSpace(12),
          const BarListView(),

          verticalSpace(18),
          BlocBuilder<BarUiCubit, BarUiState>(
            builder: (context, state) {
              return _buildSelectedSection(state);
            },
          ),
        ],
      ),
    );
  }
}
