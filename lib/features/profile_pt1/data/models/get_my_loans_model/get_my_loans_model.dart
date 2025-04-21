import 'loan.dart';

class GetMyLoansModel {
  String? status;
  List<Loan>? loans;
  int? count;

  GetMyLoansModel({this.status, this.loans, this.count});

  factory GetMyLoansModel.fromJson(Map<String, dynamic> json) =>
      GetMyLoansModel(
        status: json['status'] as String?,
        loans:
            (json['loans'] as List<dynamic>?)
                ?.map((e) => Loan.fromJson(e as Map<String, dynamic>))
                .toList(),
        count: json['count'] as int?,
      );

  Map<String, dynamic> toJson() => {
    'status': status,
    'loans': loans?.map((e) => e.toJson()).toList(),
    'count': count,
  };
}
