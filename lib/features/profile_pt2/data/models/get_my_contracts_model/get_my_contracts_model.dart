import 'data.dart';

class GetMyContractsModel {
  String? status;
  Data? data;

  GetMyContractsModel({this.status, this.data});

  factory GetMyContractsModel.fromJson(Map<String, dynamic> json) {
    return GetMyContractsModel(
      status: json['status'] as String?,
      data:
          json['data'] == null
              ? null
              : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {'status': status, 'data': data?.toJson()};
}
