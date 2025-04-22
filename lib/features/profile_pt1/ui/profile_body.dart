import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrmatrix/core/helper/spacing.dart';
import 'package:hrmatrix/features/profile_pt1/data/repo/profile_pt1_repo_impl.dart';
import 'package:hrmatrix/features/profile_pt1/logic/bar_ui/bar_ui_cubit.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/assets_ui.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/bank_account_ui.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/bar_list_view.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/documents_ui.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/family_info_ui.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/loans_ui.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/over_time_ui.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/profile_ui.dart';
import 'package:hrmatrix/features/profile_pt2/ui/widgets/air_tickets_ui.dart';
import 'package:hrmatrix/features/profile_pt2/ui/widgets/contracts_ui.dart';
import 'package:hrmatrix/features/profile_pt2/ui/widgets/disciplinary_actions_ui.dart';
import 'package:hrmatrix/features/profile_pt2/ui/widgets/financial_transaction_ui.dart';
import 'package:hrmatrix/features/profile_pt2/ui/widgets/off_boarding_ui.dart';
import 'package:hrmatrix/features/profile_pt2/ui/widgets/on_boarding_ui.dart';
import 'package:hrmatrix/features/profile_pt2/ui/widgets/part_time_ui.dart';
import 'package:hrmatrix/features/profile_pt2/ui/widgets/time_off_ui.dart';

import '../../../core/di/set_up.dart';
import '../../profile_pt2/data/repo/profile_pt2_repo_impl.dart';
import '../../profile_pt2/logic/get_my_air_tickets/get_my_air_tickets_cubit.dart';
import '../../profile_pt2/logic/get_my_financial_transaction/get_my_financial_transaction_cubit.dart';
import '../logic/get_my_assets/get_my_assets_cubit.dart';
import '../logic/get_my_documents/get_my_documents_cubit.dart';
import '../logic/get_my_loans/get_my_loans_cubit.dart';
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
      DocumentsState:
          () => BlocProvider(
            create:
                (context) => GetMyDocumentsCubit(
                  profilePt1RepoImpl: getIt.get<ProfilePt1RepoImpl>(),
                ),
            child: DocumentsUI(),
          ),
      LoansState:
          () => BlocProvider(
            create:
                (context) => GetMyLoansCubit(
                  profilePt1RepoImpl: getIt.get<ProfilePt1RepoImpl>(),
                ),
            child: LoansUI(),
          ),
      OverTimeState: () => OverTimeUI(),
      AssetsState:
          () => BlocProvider(
            create:
                (context) => GetMyAssetsCubit(
                  profilePt1RepoImpl: getIt.get<ProfilePt1RepoImpl>(),
                ),
            child: AssetsUI(),
          ),
      AirTicketsState:
          () => BlocProvider(
            create:
                (context) => GetMyAirTicketsCubit(
                  profilePt2RepoImpl: getIt.get<ProfilePt2RepoImpl>(),
                ),
            child: AirTicketsUI(),
          ),
      FinancialTransactionState:
          () => BlocProvider(
            create:
                (context) => GetMyFinancialTransactionCubit(
                  profilePt2RepoImpl: getIt.get<ProfilePt2RepoImpl>(),
                ),
            child: FinancialTransactionUI(),
          ),
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
