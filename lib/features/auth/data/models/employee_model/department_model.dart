import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

part 'department_model.g.dart';

@HiveType(typeId: 1)
class DepartmentModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? type;
  @HiveField(3)
  dynamic parentId;
  @HiveField(4)
  int? hodId;
  @HiveField(5)
  dynamic directorId;
  @HiveField(6)
  int? companyId;
  String? createdAt;
  String? updatedAt;

  DepartmentModel({
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

  factory DepartmentModel.fromJson(Map<String, dynamic> json) =>
      DepartmentModel(
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
