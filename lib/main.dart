import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hrmatrix/core/di/set_up.dart';
import 'package:hrmatrix/core/typography/simple_bloc_observer.dart';
import 'package:hrmatrix/features/auth/data/models/employee_model/department_model.dart';
import 'package:hrmatrix/features/auth/data/models/employee_model/employee_model.dart';
import 'package:hrmatrix/features/auth/data/models/employee_model/family_info_model.dart';
import 'package:hrmatrix/features/auth/data/models/employee_model/over_time_request_model.dart';
import 'package:hrmatrix/features/auth/data/models/employee_model/salary_details_model.dart';
import 'package:hrmatrix/hrmatrix.dart';

EmployeeModel? employeeModel;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  setup();
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(EmployeeModelAdapter());
  Hive.registerAdapter(DepartmentModelAdapter());
  Hive.registerAdapter(SalaryDetailsModelAdapter());
  Hive.registerAdapter(OverTimeRequestModelAdapter());
  Hive.registerAdapter(FamilyInfoModelAdapter());
  runApp(const Hrmatrix());
}
