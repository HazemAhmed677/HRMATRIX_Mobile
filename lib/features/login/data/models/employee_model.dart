import 'package:hrmatrix/features/login/data/models/department_model.dart';

class EmployeeModel {
  final int id;
  final String name;
  final String email;
  final String phoneNumber;
  final String role;
  final DateTime birthDate;
  final DepartmentModel department;

  EmployeeModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.role,
    required this.birthDate,
    required this.department,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    phoneNumber: json['phoneNumber'],
    role: json['role'],
    birthDate: DateTime.parse(json['birthDate']),
    department: DepartmentModel.fromJson(json['department']),
  );
}
