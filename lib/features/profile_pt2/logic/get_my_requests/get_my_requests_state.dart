part of 'get_my_requests_cubit.dart';

sealed class GetMyRequestsState {}

final class GetMyRequestsInitial extends GetMyRequestsState {}

final class GetMyRequestsLoading extends GetMyRequestsState {}

final class GetMyRequestsSuccess extends GetMyRequestsState {
  /// time off & vacation (paid and sick) & over time
  final GetMyRequestsModel getMyRequestsModel;
  GetMyRequestsSuccess({required this.getMyRequestsModel});
}

final class GetMyRequestsFailure extends GetMyRequestsState {
  final String errorMsg;
  GetMyRequestsFailure({required this.errorMsg});
}
