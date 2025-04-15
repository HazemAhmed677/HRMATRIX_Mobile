import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/layout/main_layout/main_layout.dart';
import 'package:hrmatrix/layout/sidebar/logic/sidebar_cubit.dart';

class Hrmatrix extends StatelessWidget {
  const Hrmatrix({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(390, 844),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => SidebarCubit(),
          child: MainLayout(),
        ),
      ),
    );
  }
}
