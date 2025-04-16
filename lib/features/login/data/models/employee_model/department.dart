class Department {
  int? id;
  String? name;
  String? type;
  dynamic parentId;
  int? hodId;
  dynamic directorId;
  int? companyId;
  String? createdAt;
  String? updatedAt;

  Department({
    this.id,
    this.name,
    this.type,
    this.parentId,
    this.hodId,
    this.directorId,
    this.companyId,
    this.createdAt,
    this.updatedAt,
  });

  factory Department.fromJson(Map<String, dynamic> json) => Department(
    id: json['id'] as int?,
    name: json['name'] as String?,
    type: json['type'] as String?,
    parentId: json['parentId'] as dynamic,
    hodId: json['hodId'] as int?,
    directorId: json['directorId'] as dynamic,
    companyId: json['companyId'] as int?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'type': type,
    'parentId': parentId,
    'hodId': hodId,
    'directorId': directorId,
    'companyId': companyId,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}
