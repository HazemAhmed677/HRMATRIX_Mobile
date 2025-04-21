import 'package:hive/hive.dart';

part 'family_info_model.g.dart';

@HiveType(typeId: 4)
class FamilyInfoModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? phoneNumber;
  @HiveField(3)
  String? relation;
  int? employeeId;
  int? companyId;
  String? createdAt;
  String? updatedAt;

  FamilyInfoModel({
    this.id,
    this.name,
    this.phoneNumber,
    this.relation,
    this.employeeId,
    this.companyId,
    this.createdAt,
    this.updatedAt,
  });

  factory FamilyInfoModel.fromJson(Map<String, dynamic> json) =>
      FamilyInfoModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        phoneNumber: json['phoneNumber'] as String?,
        relation: json['relation'] as String?,
        employeeId: json['employeeId'] as int?,
        companyId: json['companyId'] as int?,
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?,
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'phoneNumber': phoneNumber,
    'relation': relation,
    'employeeId': employeeId,
    'companyId': companyId,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}
