import 'package:bloc/bloc.dart';
import 'package:hrmatrix/features/profile_pt2/data/models/get_my_requests_model/get_my_requests_model.dart';

import '../../data/repo/profile_pt2_repo_impl.dart';

part 'get_my_time_off_state.dart';

class GetMyTimeOffCubit extends Cubit<GetMyTimeOffState> {
  final ProfilePt2RepoImpl profilePt2RepoImpl;

  GetMyTimeOffCubit({required this.profilePt2RepoImpl})
    : super(GetMyTimeOffInitial());

  Future<void> getMyTimeOff() async {
    if (isClosed) return;

    emit(GetMyTimeOffLoading());

    final result = await profilePt2RepoImpl.getMyTimeOff();

    result.fold(
      (failureService) {
        if (!isClosed) {
          emit(GetMyTimeOffFailure(errorMsg: failureService.errorMsg));
        }
      },
      (right) {
        if (!isClosed) {
          emit(GetMyTimeOffSuccess(getMyRequestsModel: right));
        }
      },
    );
  }
}
