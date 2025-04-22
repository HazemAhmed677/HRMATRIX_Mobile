part of 'get_my_time_off_cubit.dart';

sealed class GetMyTimeOffState {}

final class GetMyTimeOffInitial extends GetMyTimeOffState {}

final class GetMyTimeOffLoading extends GetMyTimeOffState {}

final class GetMyTimeOffSuccess extends GetMyTimeOffState {
  /// time off & vacation (paid and sick) & over time
  final GetMyRequestsModel getMyRequestsModel;

  GetMyTimeOffSuccess({required this.getMyRequestsModel});
}

final class GetMyTimeOffFailure extends GetMyTimeOffState {
  final String errorMsg;

  GetMyTimeOffFailure({required this.errorMsg});
}
