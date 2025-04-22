import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hrmatrix/layout/main_layout/main_layout.dart';
import 'package:hrmatrix/layout/sidebar/logic/sidebar_cubit.dart';

import '../../core/helpers/constants.dart';
import '../../core/helpers/logger.dart';
import '../../core/helpers/shard_pref_helper.dart';
import '../../core/routing/routes.dart';
import '../../core/theming/app_color.dart';
import '../../features/auth/data/local/employee_hive_services.dart';
import '../../features/auth/logic/refresh_token/refresh_token_cubit.dart';
import '../../main.dart';

class SholdRefreshToken extends StatefulWidget {
  const SholdRefreshToken({super.key});

  @override
  State<SholdRefreshToken> createState() => _SholdRefreshTokenState();
}

class _SholdRefreshTokenState extends State<SholdRefreshToken> {
  bool isLoading1 = true;
  String? token;
  bool isLoading2 = true;

  @override
  void initState() {
    super.initState();
    _loadUser();
    _loadToken();
  }

  Future<void> _loadUser() async {
    employeeModel = await EmployeeHiveServices.getEmployeeLocally();
    setState(() {
      isLoading1 = false;
    });
    loggerError(employeeModel?.email?.toString() ?? 'USER MODEL IS NULL');
  }

  Future<void> _loadToken() async {
    final String? tokenStored = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.employeeToken,
    );

    loggerDebug("Stored token: $tokenStored");

    if (tokenStored == null || tokenStored.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go(Routes.login);
      });
      return;
    }

    final bool shouldRefresh = await _shouldRefreshToken();

    if (shouldRefresh) {
      if (mounted) {
        await BlocProvider.of<RefreshTokenCubit>(
          context,
        ).refreshToken(storedToken: tokenStored);
      }
    }

    setState(() {
      token = tokenStored;
      isLoading2 = false;
    });
  }

  Future<bool> _shouldRefreshToken() async {
    final int storedDay = await SharedPrefHelper.getInt(
      SharedPrefKeys.storedTokenTime,
    );

    final int currentDay = DateTime.now().millisecondsSinceEpoch ~/ 86400000;
    return (currentDay - storedDay) >= 3;
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading1 || isLoading2) {
      return const Scaffold(
        backgroundColor: AppColors.background,
        body: Center(child: CircularProgressIndicator(color: AppColors.blue)),
      );
    }

    if (employeeModel == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go(Routes.login);
      });
      return const SizedBox.shrink();
    }

    return BlocListener<RefreshTokenCubit, RefreshTokenState>(
      listener: (context, state) {
        if (state is RefreshTokenFailure) {
          context.go(Routes.login);
        }
      },
      child: BlocProvider(
        create: (context) => SidebarCubit(),
        child: const MainLayout(),
      ),
    );
  }
}
