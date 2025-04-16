import "package:get_it/get_it.dart";
import "package:hrmatrix/core/networking/api_service.dart";
import "package:hrmatrix/features/login/data/repo/login_repo_impl.dart";

final GetIt getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton(ApiService());

  getIt.registerSingleton(LoginRepoImpl(apiService: getIt.get<ApiService>()));
}
