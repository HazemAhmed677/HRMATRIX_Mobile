class GetMyDisciplinaryAtionsModel {
  int? id;
  String? rule;
  int? actionType;
  int? duration;
  String? deductionType;
  String? attachment;
  int? employeeId;
  int? companyId;
  String? createdAt;
  String? updatedAt;

  GetMyDisciplinaryAtionsModel({
    this.id,
    this.rule,
    this.actionType,
    this.duration,
    this.deductionType,
    this.attachment,
    this.employeeId,
    this.companyId,
    this.createdAt,
    this.updatedAt,
  });

  factory GetMyDisciplinaryAtionsModel.fromJson(Map<String, dynamic> json) {
    return GetMyDisciplinaryAtionsModel(
      id: json['id'] as int?,
      rule: json['rule'] as String?,
      actionType: json['actionType'] as int?,
      duration: json['duration'] as int?,
      deductionType: json['deductionType'] as String?,
      attachment: json['attachment'] as String?,
      employeeId: json['employeeId'] as int?,
      companyId: json['companyId'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'rule': rule,
    'actionType': actionType,
    'duration': duration,
    'deductionType': deductionType,
    'attachment': attachment,
    'employeeId': employeeId,
    'companyId': companyId,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}
