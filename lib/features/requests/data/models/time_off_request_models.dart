class TimeOffRequestModel {
  String? type;
  int? timeOff;
  String? content;
  String? timeOffDate;
  String? fromHour;
  String? toHour;

  TimeOffRequestModel({
    this.type = 'Time Off',
    this.timeOff = 1,
    this.content,
    this.timeOffDate,
    this.fromHour,
    this.toHour,
  });

  factory TimeOffRequestModel.fromJson(Map<String, dynamic> json) {
    return TimeOffRequestModel(
      type: json['type'] as String?,
      timeOff: json['timeOff'] as int?,
      content: json['content'] as String?,
      timeOffDate: json['timeOffDate'] as String?,
      fromHour: json['fromHour'] as String?,
      toHour: json['toHour'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'type': type,
    'timeOff': timeOff,
    'content': content,
    'timeOffDate': timeOffDate,
    'fromHour': fromHour,
    'toHour': toHour,
  };
}
