import 'package:bloc/bloc.dart';
import 'package:hrmatrix/features/profile_pt2/data/models/get_my_disciplinary_ations_model/get_my_disciplinary_ations_model.dart';

import '../../data/repo/profile_pt2_repo_impl.dart';

part 'get_my_disciplinary_actions_state.dart';

class GetMyDisciplinaryActionsCubit
    extends Cubit<GetMyDisciplinaryActionsState> {
  final ProfilePt2RepoImpl profilePt2RepoImpl;

  GetMyDisciplinaryActionsCubit({required this.profilePt2RepoImpl})
    : super(GetMyDisciplinaryActionsInitial());

  Future<void> getMyDisciplinaryActions() async {
    if (isClosed) return;

    emit(GetMyDisciplinaryActionsLoading());

    final result = await profilePt2RepoImpl.getMyDisciplinaryActions();

    result.fold(
      (failureService) {
        if (!isClosed) {
          emit(
            GetMyDisciplinaryActionsFailure(errorMsg: failureService.errorMsg),
          );
        }
      },
      (right) {
        if (!isClosed) {
          emit(
            GetMyDisciplinaryActionsSuccess(
              getMyDisciplinaryActionsList: right,
            ),
          );
        }
      },
    );
  }
}
