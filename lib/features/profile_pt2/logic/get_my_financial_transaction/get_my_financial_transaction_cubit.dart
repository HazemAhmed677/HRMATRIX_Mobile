import 'package:bloc/bloc.dart';

import '../../data/models/get_my_financial_transaction_model/get_my_financial_transaction_model.dart';
import '../../data/repo/profile_pt2_repo_impl.dart';

part 'get_my_financial_transaction_state.dart';

class GetMyFinancialTransactionCubit
    extends Cubit<GetMyFinancialTransactionState> {
  final ProfilePt2RepoImpl profilePt2RepoImpl;

  GetMyFinancialTransactionCubit({required this.profilePt2RepoImpl})
    : super(GetMyFinancialTransactionInitial());

  Future<void> getMyFinancialTransactions() async {
    if (isClosed) return;

    emit(GetMyFinancialTransactionLoading());

    final result = await profilePt2RepoImpl.getMyFinancialTransaction();

    result.fold(
      (failureService) {
        if (!isClosed) {
          emit(
            GetMyFinancialTransactionFailure(errorMsg: failureService.errorMsg),
          );
        }
      },
      (right) {
        if (!isClosed) {
          emit(
            GetMyFinancialTransactionSuccess(
              getMyFinancialTransactionModel: right,
            ),
          );
        }
      },
    );
  }
}
