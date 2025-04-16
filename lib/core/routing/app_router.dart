import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hrmatrix/core/di/set_up.dart';
import 'package:hrmatrix/core/routing/routes.dart';
import 'package:hrmatrix/core/widgets/custom_slider_transition.dart';
import 'package:hrmatrix/features/auth/data/repo/auth_repo_impl.dart';
import 'package:hrmatrix/layout/main_layout/main_layout.dart';
import 'package:hrmatrix/layout/sidebar/logic/sidebar_cubit.dart';

import '../../features/auth/logic/login/login_cubit.dart';
import '../../features/auth/ui/login_view.dart';
import '../helper/constants.dart';
import '../helper/logger.dart';
import '../helper/shard_pref_helper.dart';

bool _isAuthRoute(String location) {
  return location == Routes.login;
}

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    redirect: (BuildContext context, GoRouterState state) async {
      final userToken = await SharedPrefHelper.getSecuredString(
        SharedPrefKeys.employeeToken,
      );
      final bool isLoggedIn = userToken != null && userToken.isNotEmpty;
      final isAuthRoute = _isAuthRoute(state.uri.toString());
      loggerDebug("hereereee ${state.uri.toString()}");
      if (!isLoggedIn && !isAuthRoute) {
        return Routes.login;
      } else if (isLoggedIn && isAuthRoute) {
        return Routes.initial;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: Routes.login,
        pageBuilder:
            (context, state) => CustomSliderTransition(
              child: BlocProvider(
                create:
                    (context) =>
                        LogInCubit(loginRepoImpl: getIt.get<AuthRepoImpl>()),
                child: const LoginView(),
              ),
              key: state.pageKey,
              duration: 300,
            ),
      ),

      GoRoute(
        path: Routes.initial,
        pageBuilder:
            (context, state) => CustomSliderTransition(
              child: BlocProvider(
                create: (context) => SidebarCubit(),
                child: const MainLayout(),
              ),
              key: state.pageKey,
              duration: 300,
            ),
      ),
    ],
  );
}
