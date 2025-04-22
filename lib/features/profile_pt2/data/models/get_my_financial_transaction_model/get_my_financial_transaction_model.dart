import 'my_approved_financial_transaction.dart';

class GetMyFinancialTransactionModel {
  String? status;
  List<MyApprovedFinancialTransaction>? myApprovedFinancialTransaction;
  int? count;

  GetMyFinancialTransactionModel({
    this.status,
    this.myApprovedFinancialTransaction,
    this.count,
  });

  factory GetMyFinancialTransactionModel.fromJson(Map<String, dynamic> json) {
    return GetMyFinancialTransactionModel(
      status: json['status'] as String?,
      myApprovedFinancialTransaction:
          (json['myApprovedFinancialTransaction'] as List<dynamic>?)
              ?.map(
                (e) => MyApprovedFinancialTransaction.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
      count: json['count'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'myApprovedFinancialTransaction':
        myApprovedFinancialTransaction?.map((e) => e.toJson()).toList(),
    'count': count,
  };
}
