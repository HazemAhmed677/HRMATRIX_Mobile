import 'package:bloc/bloc.dart';

import '../../data/models/over_time_request_model.dart';
import '../../data/repo/request_repo_impl.dart';

part 'post_over_time_state.dart';

class PostOverTimeCubit extends Cubit<PostOverTimeState> {
  final RequestRepoImpl requestRepoImpl;

  PostOverTimeCubit({required this.requestRepoImpl})
    : super(PostOverTimeInitial());

  Future<void> postOverTime({
    required OverTimeRequestModel overtimeRequestModel,
  }) async {
    if (isClosed) return;

    emit(PostOverTimeLoading());

    final result = await requestRepoImpl.sentOverTimeRequest(
      overTimeRequestModel: overtimeRequestModel,
    );
    ();

    result.fold(
      (failureService) {
        if (!isClosed) {
          emit(PostOverTimeFailure(errorMsg: failureService.errorMsg));
        }
      },
      (_) {
        if (!isClosed) {
          emit(PostOverTimeSuccess());
        }
      },
    );
  }
}
