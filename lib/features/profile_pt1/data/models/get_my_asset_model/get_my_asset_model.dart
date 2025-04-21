class GetMyAssetModel {
  int? id;
  String? attachments;
  String? name;
  String? serialNumber;
  String? condition;
  String? description;
  String? holdingDate;
  String? droppingDate;
  dynamic rejectionReason;
  bool? monthlyNotified;
  String? status;
  bool? droppingNotified;
  int? employeeId;
  int? companyId;
  String? createdAt;
  String? updatedAt;

  GetMyAssetModel({
    this.id,
    this.attachments,
    this.name,
    this.serialNumber,
    this.condition,
    this.description,
    this.holdingDate,
    this.droppingDate,
    this.rejectionReason,
    this.monthlyNotified,
    this.status,
    this.droppingNotified,
    this.employeeId,
    this.companyId,
    this.createdAt,
    this.updatedAt,
  });

  factory GetMyAssetModel.fromJson(Map<String, dynamic> json) {
    return GetMyAssetModel(
      id: json['id'] as int?,
      attachments: json['attachments'] as String?,
      name: json['name'] as String?,
      serialNumber: json['serialNumber'] as String?,
      condition: json['condition'] as String?,
      description: json['description'] as String?,
      holdingDate: json['holdingDate'] as String?,
      droppingDate: json['droppingDate'] as String?,
      rejectionReason: json['rejectionReason'] as dynamic,
      monthlyNotified: json['monthlyNotified'] as bool?,
      status: json['status'] as String?,
      droppingNotified: json['droppingNotified'] as bool?,
      employeeId: json['employeeId'] as int?,
      companyId: json['companyId'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'attachments': attachments,
    'name': name,
    'serialNumber': serialNumber,
    'condition': condition,
    'description': description,
    'holdingDate': holdingDate,
    'droppingDate': droppingDate,
    'rejectionReason': rejectionReason,
    'monthlyNotified': monthlyNotified,
    'status': status,
    'droppingNotified': droppingNotified,
    'employeeId': employeeId,
    'companyId': companyId,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}
