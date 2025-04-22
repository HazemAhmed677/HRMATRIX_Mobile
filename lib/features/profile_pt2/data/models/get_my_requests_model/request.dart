import 'requester.dart';

class Request {
  int? id;
  String? type;
  String? content;
  dynamic rejectionReason;
  String? status;
  String? suggestion;
  dynamic expectedSalary;
  dynamic vacationDays;
  dynamic vacationStartDate;
  dynamic vacationEndDate;
  int? timeOff;
  dynamic overTime;
  dynamic overTimeDate;
  dynamic overTimeStart;
  dynamic overTimeEnd;
  int? requestedBy;
  dynamic requestedTo;
  String? timeOffDate;
  String? timeOffFromHour;
  String? timeOffToHour;
  dynamic repliedBy;
  int? companyId;
  String? createdAt;
  Requester? requester;
  dynamic requestedToEmployee;

  Request({
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
    this.requester,
    this.requestedToEmployee,
  });

  factory Request.fromJson(Map<String, dynamic> json) => Request(
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
    timeOff: json['timeOff'] as int?,
    overTime: json['overTime'] as dynamic,
    overTimeDate: json['overTimeDate'] as dynamic,
    overTimeStart: json['overTimeStart'] as dynamic,
    overTimeEnd: json['overTimeEnd'] as dynamic,
    requestedBy: json['requestedBy'] as int?,
    requestedTo: json['requestedTo'] as dynamic,
    timeOffDate: json['timeOffDate'] as String?,
    timeOffFromHour: json['timeOffFromHour'] as String?,
    timeOffToHour: json['timeOffToHour'] as String?,
    repliedBy: json['repliedBy'] as dynamic,
    companyId: json['companyId'] as int?,
    createdAt: json['createdAt'] as String?,
    requester:
        json['requester'] == null
            ? null
            : Requester.fromJson(json['requester'] as Map<String, dynamic>),
    requestedToEmployee: json['requestedToEmployee'] as dynamic,
  );

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
    'requester': requester?.toJson(),
    'requestedToEmployee': requestedToEmployee,
  };
}
