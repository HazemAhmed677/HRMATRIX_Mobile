import 'package:bloc/bloc.dart';
import 'package:hrmatrix/features/profile_pt1/data/models/get_my_loans_model/get_my_loans_model.dart';

import '../../data/repo/profile_pt1_repo_impl.dart';

part 'get_my_loans_state.dart';

class GetMyLoansCubit extends Cubit<GetMyLoansState> {
  final ProfilePt1RepoImpl profilePt1RepoImpl;

  GetMyLoansCubit({required this.profilePt1RepoImpl})
    : super(GetMyLoansInitial());

  Future<void> getMyLoans() async {
    if (isClosed) return;

    emit(GetMyLoansLoading());

    final result = await profilePt1RepoImpl.getMyLoans();

    result.fold(
      (failureService) {
        if (!isClosed) {
          emit(GetMyLoansFailure(errorMsg: failureService.errorMsg));
        }
      },
      (right) {
        if (!isClosed) {
          emit(GetMyLoansSuccess(getMyLoansModel: right));
        }
      },
    );
  }
}
