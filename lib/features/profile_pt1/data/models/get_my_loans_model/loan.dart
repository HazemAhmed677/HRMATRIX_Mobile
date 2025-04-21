class Loan {
  int? id;
  int? amount;
  String? type;
  int? term;
  String? status;
  String? effectiveDate;
  int? installments;
  int? numberOfPayments;
  int? employeeId;
  dynamic approvedOrRejectedBy;
  int? companyId;
  String? createdAt;
  dynamic updatedAt;

  Loan({
    this.id,
    this.amount,
    this.type,
    this.term,
    this.status,
    this.effectiveDate,
    this.installments,
    this.numberOfPayments,
    this.employeeId,
    this.approvedOrRejectedBy,
    this.companyId,
    this.createdAt,
    this.updatedAt,
  });

  factory Loan.fromJson(Map<String, dynamic> json) => Loan(
    id: json['id'] as int?,
    amount: json['amount'] as int?,
    type: json['type'] as String?,
    term: json['term'] as int?,
    status: json['status'] as String?,
    effectiveDate: json['effectiveDate'] as String?,
    installments: json['installments'] as int?,
    numberOfPayments: json['numberOfPayments'] as int?,
    employeeId: json['employeeId'] as int?,
    approvedOrRejectedBy: json['approvedOrRejectedBy'] as dynamic,
    companyId: json['companyId'] as int?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as dynamic,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'amount': amount,
    'type': type,
    'term': term,
    'status': status,
    'effectiveDate': effectiveDate,
    'installments': installments,
    'numberOfPayments': numberOfPayments,
    'employeeId': employeeId,
    'approvedOrRejectedBy': approvedOrRejectedBy,
    'companyId': companyId,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}
