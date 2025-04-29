import 'package:hrmatrix/features/auth/data/local/employee_hive_services.dart';
import 'package:hrmatrix/features/auth/data/models/employee_model/employee_model.dart';
import 'package:hrmatrix/main.dart';

Future<void> updateEmployeeModel({required EmployeeModel newOne}) async {
  employeeModel!.name = newOne.name;
  employeeModel!.address = newOne.address;
  employeeModel!.avatar = newOne.avatar;
  await EmployeeHiveServices.updateEmployeeLocally(employeeModel!);
}
