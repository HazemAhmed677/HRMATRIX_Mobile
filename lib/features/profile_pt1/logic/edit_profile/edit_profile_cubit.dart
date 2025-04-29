import 'package:bloc/bloc.dart';
import 'package:hrmatrix/features/auth/data/models/employee_model/employee_model.dart';
import 'package:hrmatrix/features/profile_pt1/data/models/edit_profile_request_model.dart';

import '../../data/repo/profile_pt1_repo_impl.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final ProfilePt1RepoImpl profilePt1RepoImpl;

  EditProfileCubit({required this.profilePt1RepoImpl})
    : super(EditProfileInitial());

  Future<void> editProfile({
    required EditProfileRequestModel editProfileRequestModel,
  }) async {
    if (isClosed) return;

    emit(EditProfileLoading());

    final result = await profilePt1RepoImpl.editProfile(
      editProfileRequestModel: editProfileRequestModel,
    );

    result.fold(
      (failureService) {
        if (!isClosed) {
          emit(EditProfileFailure(errorMsg: failureService.errorMsg));
        }
      },
      (employeeModel) {
        if (!isClosed) {
          emit(EditProfileSuccess(employeeModel: employeeModel));
        }
      },
    );
  }
}
