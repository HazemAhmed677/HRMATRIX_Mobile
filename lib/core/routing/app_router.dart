import 'package:go_router/go_router.dart';
import 'package:hrmatrix/core/routing/routes.dart';
import 'package:hrmatrix/core/widgets/custom_slider_transition.dart';

import '../../features/auth/ui/login_view.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.login,
        pageBuilder:
            (context, state) => CustomSliderTransition(
              child: const LoginView(),
              key: state.pageKey,
              duration: 300,
            ),
      ),
    ],
  );
}
