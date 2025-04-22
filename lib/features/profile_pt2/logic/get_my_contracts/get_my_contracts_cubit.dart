import 'package:bloc/bloc.dart';

import '../../data/repo/profile_pt2_repo_impl.dart';
import 'get_my_contracts_state.dart';

class GetMyContractsCubit extends Cubit<GetMyContractsState> {
  final ProfilePt2RepoImpl profilePt2RepoImpl;

  GetMyContractsCubit({required this.profilePt2RepoImpl})
    : super(GetMyContractsInitial());

  Future<void> getMyContracts() async {
    if (isClosed) return;

    emit(GetMyContractsLoading());

    final result = await profilePt2RepoImpl.getMyContracts();

    result.fold(
      (failureService) {
        if (!isClosed) {
          emit(GetMyContractsFailure(errorMsg: failureService.errorMsg));
        }
      },
      (right) {
        if (!isClosed) {
          emit(GetMyContractsSuccess(getMyContractsModel: right));
        }
      },
    );
  }
}
