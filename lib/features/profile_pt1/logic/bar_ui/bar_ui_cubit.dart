import 'package:bloc/bloc.dart';

part 'bar_ui_state.dart';

class BarUiCubit extends Cubit<BarUiState> {
  BarUiCubit() : super(ProfileState());
  void rebuild({required int index}) {
    if (index == 0) {
      emit(ProfileState());
    } else if (index == 1) {
      emit(BankAccountState());
    } else if (index == 2) {
      emit(FamilyInfoState());
    } else if (index == 3) {
      emit(DocumentsState());
    } else if (index == 4) {
      emit(LoansState());
    } else if (index == 5) {
      emit(OverTimeState());
    } else if (index == 6) {
      emit(AssetsState());
    } else if (index == 7) {
      emit(AirTicketsState());
    } else if (index == 8) {
      emit(FinancialTransactionState());
    } else if (index == 9) {
      emit(TimeOffState());
    } else if (index == 10) {
      emit(PartTimeState());
    } else if (index == 11) {
      emit(DisciplinaryActionsState());
    } else if (index == 12) {
      emit(ContractsState());
    } else if (index == 13) {
      emit(OnBoardingState());
    } else if (index == 14) {
      emit(OffBoardingState());
    }
  }
}
