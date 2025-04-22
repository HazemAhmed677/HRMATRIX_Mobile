class MyApprovedFinancialTransaction {
  int? id;
  String? name;
  String? transactionType;
  String? amount;
  String? status;
  String? effectiveDate;
  String? payrollStatus;
  dynamic rejectionReason;
  String? attachment;
  int? employeeNumber;
  dynamic statuesUpdatedBy;
  int? companyId;
  String? createdAt;
  String? updatedAt;
  dynamic statuesUpdatedByEmp;

  MyApprovedFinancialTransaction({
    this.id,
    this.name,
    this.transactionType,
    this.amount,
    this.status,
    this.effectiveDate,
    this.payrollStatus,
    this.rejectionReason,
    this.attachment,
    this.employeeNumber,
    this.statuesUpdatedBy,
    this.companyId,
    this.createdAt,
    this.updatedAt,
    this.statuesUpdatedByEmp,
  });

  factory MyApprovedFinancialTransaction.fromJson(Map<String, dynamic> json) {
    return MyApprovedFinancialTransaction(
      id: json['id'] as int?,
      name: json['name'] as String?,
      transactionType: json['transaction_type'] as String?,
      amount: json['amount'] as String?,
      status: json['status'] as String?,
      effectiveDate: json['effectiveDate'] as String?,
      payrollStatus: json['payrollStatus'] as String?,
      rejectionReason: json['rejectionReason'] as dynamic,
      attachment: json['attachment'] as String?,
      employeeNumber: json['employeeNumber'] as int?,
      statuesUpdatedBy: json['statuesUpdatedBy'] as dynamic,
      companyId: json['companyId'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      statuesUpdatedByEmp: json['statuesUpdatedByEmp'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'transaction_type': transactionType,
    'amount': amount,
    'status': status,
    'effectiveDate': effectiveDate,
    'payrollStatus': payrollStatus,
    'rejectionReason': rejectionReason,
    'attachment': attachment,
    'employeeNumber': employeeNumber,
    'statuesUpdatedBy': statuesUpdatedBy,
    'companyId': companyId,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'statuesUpdatedByEmp': statuesUpdatedByEmp,
  };
}
