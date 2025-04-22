part of 'get_my_air_tickets_cubit.dart';

sealed class GetMyAirTicketsState {}

final class GetMyAirTicketsInitial extends GetMyAirTicketsState {}

final class GetMyAirTicketsLoading extends GetMyAirTicketsState {}

final class GetMyAirTicketsSuccess extends GetMyAirTicketsState {
  final GetMyAirTicketsModel getMyAirTicketsModel;

  GetMyAirTicketsSuccess({required this.getMyAirTicketsModel});
}

final class GetMyAirTicketsFailure extends GetMyAirTicketsState {
  final String errorMsg;

  GetMyAirTicketsFailure({required this.errorMsg});
}
