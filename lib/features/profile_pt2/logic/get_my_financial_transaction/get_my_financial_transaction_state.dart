part of 'get_my_financial_transaction_cubit.dart';

sealed class GetMyFinancialTransactionState {}

final class GetMyFinancialTransactionInitial
    extends GetMyFinancialTransactionState {}

final class GetMyFinancialTransactionLoading
    extends GetMyFinancialTransactionState {}

final class GetMyFinancialTransactionSuccess
    extends GetMyFinancialTransactionState {
  final GetMyFinancialTransactionModel getMyFinancialTransactionModel;

  GetMyFinancialTransactionSuccess({
    required this.getMyFinancialTransactionModel,
  });
}

final class GetMyFinancialTransactionFailure
    extends GetMyFinancialTransactionState {
  final String errorMsg;

  GetMyFinancialTransactionFailure({required this.errorMsg});
}
