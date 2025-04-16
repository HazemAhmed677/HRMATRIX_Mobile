import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/helper/constants.dart';
import '../../../../core/helper/logger.dart';
import '../models/employee_model/employee_model.dart';

class EmployeeHiveServices {
  static Future<void> saveemployeeLocally(EmployeeModel employee) async {
    loggerInfo('🟢 Saving employee locally: $employee');

    var box = await Hive.openBox<EmployeeModel>(Constants.kEmployeeBox);
    await box.put('employee', employee);
  }

  static Future<EmployeeModel?> getemployeeLocally() async {
    loggerInfo('🟢 getting employee locally');
    var box = await Hive.openBox<EmployeeModel>(Constants.kEmployeeBox);
    return box.get('employee');
  }

  static Future<void> deleteemployeeLocally() async {
    var box = await Hive.openBox<EmployeeModel>(Constants.kEmployeeBox);
    await box.delete('employee');
  }

  static Future<void> updateemployeeLocally(
    EmployeeModel updatedemployee,
  ) async {
    var box = await Hive.openBox<EmployeeModel>(Constants.kEmployeeBox);
    await box.put('employee', updatedemployee);
  }
}
