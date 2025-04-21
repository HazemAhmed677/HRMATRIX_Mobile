import 'package:hive/hive.dart';

part 'over_time_request_model.g.dart';

@HiveType(typeId: 3)
class OverTimeRequestModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? type;
  @HiveField(2)
  String? content;
  @HiveField(3)
  dynamic rejectionReason;
  @HiveField(4)
  String? status;
  @HiveField(5)
  String? suggestion;
  dynamic expectedSalary;
  dynamic vacationDays;
  dynamic vacationStartDate;
  dynamic vacationEndDate;
  dynamic timeOff;
  @HiveField(6)
  int? overTime;
  @HiveField(7)
  String? overTimeDate;
  @HiveField(8)
  String? overTimeStart;
  @HiveField(9)
  String? overTimeEnd;
  @HiveField(10)
  int? requestedBy;
  @HiveField(11)
  int? requestedTo;
  dynamic timeOffDate;
  dynamic timeOffFromHour;
  dynamic timeOffToHour;
  dynamic repliedBy;
  int? companyId;
  String? createdAt;

  OverTimeRequestModel({
    this.id,
    this.type,
    this.content,
    this.rejectionReason,
    this.status,
    this.suggestion,
    this.expectedSalary,
    this.vacationDays,
    this.vacationStartDate,
    this.vacationEndDate,
    this.timeOff,
    this.overTime,
    this.overTimeDate,
    this.overTimeStart,
    this.overTimeEnd,
    this.requestedBy,
    this.requestedTo,
    this.timeOffDate,
    this.timeOffFromHour,
    this.timeOffToHour,
    this.repliedBy,
    this.companyId,
    this.createdAt,
  });

  factory OverTimeRequestModel.fromJson(Map<String, dynamic> json) {
    return OverTimeRequestModel(
      id: json['id'] as int?,
      type: json['type'] as String?,
      content: json['content'] as String?,
      rejectionReason: json['rejectionReason'] as dynamic,
      status: json['status'] as String?,
      suggestion: json['suggestion'] as String?,
      expectedSalary: json['expectedSalary'] as dynamic,
      vacationDays: json['vacationDays'] as dynamic,
      vacationStartDate: json['vacationStartDate'] as dynamic,
      vacationEndDate: json['vacationEndDate'] as dynamic,
      timeOff: json['timeOff'] as dynamic,
      overTime: json['overTime'] as int?,
      overTimeDate: json['overTimeDate'] as String?,
      overTimeStart: json['overTimeStart'] as String?,
      overTimeEnd: json['overTimeEnd'] as String?,
      requestedBy: json['requestedBy'] as int?,
      requestedTo: json['requestedTo'] as int?,
      timeOffDate: json['timeOffDate'] as dynamic,
      timeOffFromHour: json['timeOffFromHour'] as dynamic,
      timeOffToHour: json['timeOffToHour'] as dynamic,
      repliedBy: json['repliedBy'] as dynamic,
      companyId: json['companyId'] as int?,
      createdAt: json['createdAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'content': content,
    'rejectionReason': rejectionReason,
    'status': status,
    'suggestion': suggestion,
    'expectedSalary': expectedSalary,
    'vacationDays': vacationDays,
    'vacationStartDate': vacationStartDate,
    'vacationEndDate': vacationEndDate,
    'timeOff': timeOff,
    'overTime': overTime,
    'overTimeDate': overTimeDate,
    'overTimeStart': overTimeStart,
    'overTimeEnd': overTimeEnd,
    'requestedBy': requestedBy,
    'requestedTo': requestedTo,
    'timeOffDate': timeOffDate,
    'timeOffFromHour': timeOffFromHour,
    'timeOffToHour': timeOffToHour,
    'repliedBy': repliedBy,
    'companyId': companyId,
    'createdAt': createdAt,
  };
}
