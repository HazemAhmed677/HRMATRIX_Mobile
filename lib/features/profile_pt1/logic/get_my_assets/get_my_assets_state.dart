part of 'get_my_assets_cubit.dart';

sealed class GetMyAssetsState {}

final class GetMyAssetsInitial extends GetMyAssetsState {}

final class GetMyAssetsLoading extends GetMyAssetsState {}

final class GetMyAssetsSuccess extends GetMyAssetsState {
  final List<GetMyAssetModel> getMyAssetsList;

  GetMyAssetsSuccess({required this.getMyAssetsList});
}

final class GetMyAssetsFailure extends GetMyAssetsState {
  final String errorMsg;

  GetMyAssetsFailure({required this.errorMsg});
}
