import 'package:bloc/bloc.dart';
import 'package:hrmatrix/features/auth/data/repo/auth_repo_impl.dart';
import 'package:meta/meta.dart';

import '../../../../core/helpers/logger.dart';
import '../../data/models/employee_model/employee_model.dart';

part 'login_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit({required this.loginRepoImpl}) : super(LogInInitial());
  final AuthRepoImpl loginRepoImpl;

  Future<void> login({required String email, required String password}) async {
    if (isClosed) return;
    emit(LogInLoading());
    var response = await loginRepoImpl.login(email: email, password: password);
    response.fold(
      (failure) {
        loggerError(failure.errorMsg);
        if (!isClosed) emit(LogInFailure(errorMsg: failure.errorMsg));
      },
      (employeeModel) {
        loggerError(employeeModel.toString());
        if (!isClosed) emit(LogInSuccess(employeeModel: employeeModel));
      },
    );
  }
}
