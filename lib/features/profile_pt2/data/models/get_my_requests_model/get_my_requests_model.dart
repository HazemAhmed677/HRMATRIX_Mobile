import 'data.dart';

class GetMyRequestsModel {
  String? status;
  Data? data;

  GetMyRequestsModel({this.status, this.data});

  factory GetMyRequestsModel.fromJson(Map<String, dynamic> json) {
    return GetMyRequestsModel(
      status: json['status'] as String?,
      data:
          json['data'] == null
              ? null
              : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {'status': status, 'data': data?.toJson()};
}
