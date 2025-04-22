import "package:get_it/get_it.dart";
import "package:hrmatrix/core/networking/api_service.dart";
import "package:hrmatrix/features/auth/data/repo/auth_repo_impl.dart";
import "package:hrmatrix/features/profile_pt1/data/repo/profile_pt1_repo_impl.dart";

import "../../features/profile_pt2/data/repo/profile_pt2_repo_impl.dart";

final GetIt getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton(ApiService());

  getIt.registerSingleton(AuthRepoImpl(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton(
    ProfilePt1RepoImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerSingleton(
    ProfilePt2RepoImpl(apiService: getIt.get<ApiService>()),
  );
}
