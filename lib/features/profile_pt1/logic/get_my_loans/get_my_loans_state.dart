part of 'get_my_loans_cubit.dart';

sealed class GetMyLoansState {}

final class GetMyLoansInitial extends GetMyLoansState {}

final class GetMyLoansLoading extends GetMyLoansState {}

final class GetMyLoansSuccess extends GetMyLoansState {
  final GetMyLoansModel getMyLoansModel;

  GetMyLoansSuccess({required this.getMyLoansModel});
}

final class GetMyLoansFailure extends GetMyLoansState {
  final String errorMsg;

  GetMyLoansFailure({required this.errorMsg});
}
