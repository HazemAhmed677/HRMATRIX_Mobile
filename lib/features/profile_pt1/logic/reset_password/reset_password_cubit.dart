import 'package:bloc/bloc.dart';

import '../../data/models/reset_passwrd_request.dart';
import '../../data/repo/profile_pt1_repo_impl.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ProfilePt1RepoImpl profilePt1RepoImpl;

  ResetPasswordCubit({required this.profilePt1RepoImpl})
    : super(ResetPasswordInitial());

  Future<void> resetPassword({
    required ResetPasswrdRequestModel resetPasswordModel,
  }) async {
    if (isClosed) return;

    emit(ResetPasswordLoading());

    final result = await profilePt1RepoImpl.resetPassword(
      resetPasswordModel: resetPasswordModel,
    );

    result.fold(
      (failureService) {
        if (!isClosed) {
          emit(ResetPasswordFailure(errorMsg: failureService.errorMsg));
        }
      },
      (_) {
        if (!isClosed) {
          emit(ResetPasswordSuccess());
        }
      },
    );
  }
}
