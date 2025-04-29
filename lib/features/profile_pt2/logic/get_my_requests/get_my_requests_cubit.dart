import 'package:bloc/bloc.dart';
import 'package:hrmatrix/features/profile_pt2/data/models/get_my_requests_model/get_my_requests_model.dart';

import '../../data/repo/profile_pt2_repo_impl.dart';

part 'get_my_requests_state.dart';

class GetMyRequestsCubit extends Cubit<GetMyRequestsState> {
  final ProfilePt2RepoImpl profilePt2RepoImpl;

  GetMyRequestsCubit({required this.profilePt2RepoImpl})
    : super(GetMyRequestsInitial());

  Future<void> getMyRequests() async {
    if (isClosed) return;

    emit(GetMyRequestsLoading());

    final result = await profilePt2RepoImpl.getMyRequestsOff();

    result.fold(
      (failureService) {
        if (!isClosed) {
          emit(GetMyRequestsFailure(errorMsg: failureService.errorMsg));
        }
      },
      (right) {
        if (!isClosed) {
          emit(GetMyRequestsSuccess(getMyRequestsModel: right));
        }
      },
    );
  }
}
