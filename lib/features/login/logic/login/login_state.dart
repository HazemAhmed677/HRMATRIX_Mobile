part of 'login_cubit.dart';

@immutable
sealed class LogInState {}

final class LogInInitial extends LogInState {}

final class LogInLoading extends LogInState {}

final class LogInSuccess extends LogInState {
  final EmployeeModel employeeModel;
  LogInSuccess({required this.employeeModel});
}

final class LogInFailure extends LogInState {
  final String errorMsg;
  LogInFailure({required this.errorMsg});
}
