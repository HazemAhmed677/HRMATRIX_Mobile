class GetMyDocumentModel {
  int? id;
  String? path;
  String? title;
  String? description;
  String? expirationDate;
  String? status;
  bool? notified;
  bool? expiredNotified;
  int? employeeId;
  int? companyId;
  String? createdAt;
  String? updatedAt;

  GetMyDocumentModel({
    this.id,
    this.path,
    this.title,
    this.description,
    this.expirationDate,
    this.status,
    this.notified,
    this.expiredNotified,
    this.employeeId,
    this.companyId,
    this.createdAt,
    this.updatedAt,
  });

  factory GetMyDocumentModel.fromJson(Map<String, dynamic> json) {
    return GetMyDocumentModel(
      id: json['id'] as int?,
      path: json['path'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      expirationDate: json['expirationDate'] as String?,
      status: json['status'] as String?,
      notified: json['notified'] as bool?,
      expiredNotified: json['expiredNotified'] as bool?,
      employeeId: json['employeeId'] as int?,
      companyId: json['companyId'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'path': path,
    'title': title,
    'description': description,
    'expirationDate': expirationDate,
    'status': status,
    'notified': notified,
    'expiredNotified': expiredNotified,
    'employeeId': employeeId,
    'companyId': companyId,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}
