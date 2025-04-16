// import 'package:bloc/bloc.dart';
//   import 'package:meta/meta.dart';

// import '../../../../core/helper/logger.dart';
// import '../../data/repo/auth_repo_impl.dart';

// part 'logout_state.dart';

// class LogoutCubit extends Cubit<LogoutState> {
//   LogoutCubit({required this.authRepoImpl}) : super(LogoutInitial());
//   final AuthRepoImpl authRepoImpl;

//   Future<void> logout() async {
//     emit(LogoutLoading());
//     var response = await authRepoImpl.logout();
//     response.fold((failure) {
//       loggerError(failure.errorMsg);
//       emit(LogoutFailure(errorMsg: failure.errorMsg));
//     }, (_) {
//       emit(LogoutSuccess());
//     });
//   }
// }
