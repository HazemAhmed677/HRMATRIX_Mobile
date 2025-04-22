import 'transaction.dart';

class GetMyAirTicketsModel {
  String? status;
  List<Transaction>? transactions;

  GetMyAirTicketsModel({this.status, this.transactions});

  factory GetMyAirTicketsModel.fromJson(Map<String, dynamic> json) {
    return GetMyAirTicketsModel(
      status: json['status'] as String?,
      transactions:
          (json['transactions'] as List<dynamic>?)
              ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'transactions': transactions?.map((e) => e.toJson()).toList(),
  };
}
