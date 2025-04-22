class Contract {
  int? id;
  String? contractname;
  int? contractPeriod;
  String? startDate;
  String? endDate;
  String? contractType;
  String? attachment;
  int? terminationFees;
  dynamic terminationFeesStatus;
  int? employeeId;
  int? companyId;
  String? createdAt;
  String? updatedAt;

  Contract({
    this.id,
    this.contractname,
    this.contractPeriod,
    this.startDate,
    this.endDate,
    this.contractType,
    this.attachment,
    this.terminationFees,
    this.terminationFeesStatus,
    this.employeeId,
    this.companyId,
    this.createdAt,
    this.updatedAt,
  });

  factory Contract.fromJson(Map<String, dynamic> json) => Contract(
    id: json['id'] as int?,
    contractname: json['contractname'] as String?,
    contractPeriod: json['contractPeriod'] as int?,
    startDate: json['startDate'] as String?,
    endDate: json['endDate'] as String?,
    contractType: json['contractType'] as String?,
    attachment: json['attachment'] as String?,
    terminationFees: json['terminationFees'] as int?,
    terminationFeesStatus: json['terminationFeesStatus'] as dynamic,
    employeeId: json['employeeId'] as int?,
    companyId: json['companyId'] as int?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'contractname': contractname,
    'contractPeriod': contractPeriod,
    'startDate': startDate,
    'endDate': endDate,
    'contractType': contractType,
    'attachment': attachment,
    'terminationFees': terminationFees,
    'terminationFeesStatus': terminationFeesStatus,
    'employeeId': employeeId,
    'companyId': companyId,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}
