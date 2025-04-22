import 'contract.dart';

class Data {
  List<Contract>? contracts;

  Data({this.contracts});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    contracts:
        (json['contracts'] as List<dynamic>?)
            ?.map((e) => Contract.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'contracts': contracts?.map((e) => e.toJson()).toList(),
  };
}
