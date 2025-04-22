import 'request.dart';

class Data {
  List<Request>? requests;

  Data({this.requests});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    requests:
        (json['requests'] as List<dynamic>?)
            ?.map((e) => Request.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'requests': requests?.map((e) => e.toJson()).toList(),
  };
}
