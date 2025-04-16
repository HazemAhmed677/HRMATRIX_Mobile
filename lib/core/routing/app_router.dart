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

abstract class AppRouter {
  static final GoRouter router = GoRouter(
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
        path: Routes.mainLayout,
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
