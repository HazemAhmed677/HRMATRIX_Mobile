part of 'edit_profile_cubit.dart';

sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}

final class EditProfileLoading extends EditProfileState {}

final class EditProfileSuccess extends EditProfileState {
  final EmployeeModel employeeModel;

  EditProfileSuccess({required this.employeeModel});
}

final class EditProfileFailure extends EditProfileState {
  final String errorMsg;

  EditProfileFailure({required this.errorMsg});
}
