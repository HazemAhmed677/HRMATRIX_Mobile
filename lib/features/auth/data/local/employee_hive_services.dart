import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/logger.dart';
import '../models/employee_model/employee_model.dart';

class EmployeeHiveServices {
  static Future<void> saveEmployeeLocally(EmployeeModel employee) async {
    loggerInfo('🟢 Saving employee locally: $employee');

    var box = await Hive.openBox<EmployeeModel>(Constants.kEmployeeBox);
    await box.put('employee', employee);
  }

  static Future<EmployeeModel?> getEmployeeLocally() async {
    loggerInfo('🟢 getting employee locally');
    var box = await Hive.openBox<EmployeeModel>(Constants.kEmployeeBox);
    return box.get('employee');
  }

  static Future<void> deleteEmployeeLocally() async {
    var box = await Hive.openBox<EmployeeModel>(Constants.kEmployeeBox);
    await box.delete('employee');
  }

  static Future<void> updateEmployeeLocally(
    EmployeeModel updatedemployee,
  ) async {
    var box = await Hive.openBox<EmployeeModel>(Constants.kEmployeeBox);
    await box.put('employee', updatedemployee);
  }
}
