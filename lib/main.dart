import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hrmatrix/core/di/set_up.dart';
import 'package:hrmatrix/core/typography/simple_bloc_observer.dart';
import 'package:hrmatrix/features/auth/data/models/employee_model/employee_model.dart';
import 'package:hrmatrix/hrmatrix.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  setup();
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(EmployeeModelAdapter());
  runApp(const Hrmatrix());
}
