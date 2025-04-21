import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hrmatrix/core/helper/logger.dart';
import 'package:hrmatrix/core/helper/show_top_snack_bar.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/features/auth/logic/login/login_cubit.dart';
import 'package:hrmatrix/features/auth/ui/widgets/login_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../core/routing/routes.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _orientationHandled = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_orientationHandled &&
        MediaQuery.of(context).orientation == Orientation.landscape) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      _orientationHandled = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogInCubit, LogInState>(
      listener: (context, state) {
        if (state is LogInSuccess) {
          context.go(Routes.initial);
        } else if (state is LogInFailure) {
          loggerError(state.errorMsg);
          showErrorSnackBar(
            context: context,
            e: state.errorMsg,
            backgroundColor: AppColors.red,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LogInLoading,
          progressIndicator: CircularProgressIndicator(
            color: AppColors.authColor,
          ),
          child: const Scaffold(body: LogInViewBody()),
        );
      },
    );
  }
}
