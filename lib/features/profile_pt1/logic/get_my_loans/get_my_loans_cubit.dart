import 'package:bloc/bloc.dart';
import 'package:hrmatrix/features/profile_pt1/data/models/get_loans_model/get_loans_model.dart';

import '../../data/repo/profile_pt1_repo_impl.dart';

part 'get_my_loans_state.dart';

class GetMyLoansCubit extends Cubit<GetMyLoansState> {
  final ProfilePt1RepoImpl profilePt1RepoImpl;
  GetMyLoansCubit({required this.profilePt1RepoImpl})
    : super(GetMyLoansInitial());

  Future<void> getMyLoans() async {
    emit(GetMyLoansLoading());
    final result = await profilePt1RepoImpl.getMyLoans();
    result.fold(
      (failureService) =>
          emit(GetMyLoansFailure(errorMsg: failureService.errorMsg)),
      (right) => emit(GetMyLoansSuccess(getMyLoansModel: right)),
    );
  }
}
