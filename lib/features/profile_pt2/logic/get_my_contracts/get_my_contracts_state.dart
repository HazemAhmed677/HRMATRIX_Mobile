import '../../data/models/get_my_contracts_model/get_my_contracts_model.dart';

sealed class GetMyContractsState {}

final class GetMyContractsInitial extends GetMyContractsState {}

final class GetMyContractsLoading extends GetMyContractsState {}

final class GetMyContractsSuccess extends GetMyContractsState {
  final GetMyContractsModel getMyContractsModel;
  GetMyContractsSuccess({required this.getMyContractsModel});
}

final class GetMyContractsFailure extends GetMyContractsState {
  final String errorMsg;
  GetMyContractsFailure({required this.errorMsg});
}
