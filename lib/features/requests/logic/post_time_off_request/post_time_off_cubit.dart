import 'package:bloc/bloc.dart';

import '../../data/models/time_off_request_models.dart';
import '../../data/repo/request_repo_impl.dart';

part 'post_time_off_state.dart';

class PostTimeOffCubit extends Cubit<PostTimeOffState> {
  final RequestRepoImpl requestRepoImpl;

  PostTimeOffCubit({required this.requestRepoImpl})
    : super(PostTimeOffInitial());

  Future<void> postTimeOff({
    required TimeOffRequestModel timeOffRequestModel,
  }) async {
    if (isClosed) return;

    emit(PostTimeOffLoading());

    final result = await requestRepoImpl.sentTimeOffRequest(
      timeOffRequestModel: timeOffRequestModel,
    );
    ();

    result.fold(
      (failureService) {
        if (!isClosed) {
          emit(PostTimeOffFailure(errorMsg: failureService.errorMsg));
        }
      },
      (_) {
        if (!isClosed) {
          emit(PostTimeOffSuccess());
        }
      },
    );
  }
}
