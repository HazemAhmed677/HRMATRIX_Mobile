import 'package:bloc/bloc.dart';

import '../../data/models/get_my_asset_model/get_my_asset_model.dart';
import '../../data/repo/profile_pt1_repo_impl.dart';

part 'get_my_assets_state.dart';

class GetMyAssetsCubit extends Cubit<GetMyAssetsState> {
  final ProfilePt1RepoImpl profilePt1RepoImpl;

  GetMyAssetsCubit({required this.profilePt1RepoImpl})
    : super(GetMyAssetsInitial());

  Future<void> getMyAssets() async {
    if (isClosed) return;

    emit(GetMyAssetsLoading());

    final result = await profilePt1RepoImpl.getMyAssets();

    result.fold(
      (failureService) {
        if (!isClosed) {
          emit(GetMyAssetsFailure(errorMsg: failureService.errorMsg));
        }
      },
      (right) {
        if (!isClosed) {
          emit(GetMyAssetsSuccess(getMyAssetsList: right));
        }
      },
    );
  }
}
