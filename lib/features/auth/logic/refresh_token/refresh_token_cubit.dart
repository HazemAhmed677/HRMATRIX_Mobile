// import 'package:bloc/bloc.dart';
// import 'package:ecommerce_aimatrix/features/authentication/data/repo/auth_repo_impl.dart';
// import 'package:meta/meta.dart';

// part 'refresh_token_state.dart';

// class RefreshTokenCubit extends Cubit<RefreshTokenState> {
//   RefreshTokenCubit({required this.authRepoImpl})
//       : super(RefreshTokenInitial());
//   final AuthRepoImpl authRepoImpl;

//   Future<void> refreshToken({required String storedToken}) async {
//     if (isClosed) return;
//     emit(RefreshTokenLoading());
//     var response = await authRepoImpl.refreshToken(myToken: storedToken);
//     response.fold((failure) {
//       if (!isClosed) emit(RefreshTokenFailure(errorMsg: failure.errorMsg));
//     }, (_) {
//       if (!isClosed) emit(RefreshTokenSuccess());
//     });
//   }
// }
