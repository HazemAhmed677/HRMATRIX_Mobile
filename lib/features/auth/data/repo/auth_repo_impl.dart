import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:hrmatrix/core/errors/failure_service.dart';
import 'package:hrmatrix/core/networking/api_endpoints.dart';
import 'package:hrmatrix/core/networking/api_service.dart';
import 'package:hrmatrix/features/auth/data/repo/auth_repo.dart';

import '../../../../core/helper/constants.dart';
import '../../../../core/helper/logger.dart';
import '../../../../core/helper/shard_pref_helper.dart';
import '../local/user_model_hive_services.dart';
import '../models/employee_model/employee_model.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiService apiService;

  AuthRepoImpl({required this.apiService});

  @override
  Future<Either<FailureService, EmployeeModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      Response loginResponse = await apiService.post(
        endpoint: ApiEndpoints.login,
        data: {'email': email, 'password': password},
      );
      if (loginResponse.data != null && loginResponse.data['token'] != null) {
        await saveUserToken(loginResponse.data['token']);
        await SharedPrefHelper.storeCurrentDate();

        String securedOne = await SharedPrefHelper.getSecuredString(
          SharedPrefKeys.employeeToken,
        );
        Response userResponse = await apiService.get(
          endpoint: ApiEndpoints.getProfile,
          headers: {'Authorization': 'Bearer $securedOne'},
        );
        EmployeeModel user = EmployeeModel.fromJson(userResponse.data);
        await EmployeeHiveServices.saveemployeeLocally(user);
        return Right(user);
      } else {
        return Left(FailureService('There is no token'));
      }
    } on DioException catch (e) {
      return Left(
        FailureService.fromDioException(
          dioExecption: e,
          statusCode: e.response?.statusCode,
          dioExecptionType: e.type,
        ),
      );
    } catch (e) {
      loggerError(e.toString());
      return Left(FailureService(e.toString()));
    }
  }

  @override
  Future<Either<FailureService, void>> refreshToken({
    required String oldToken,
  }) async {
    try {
      Response loginResponse = await apiService.post(
        endpoint: ApiEndpoints.refreshToken,
        headers: {'Authorization': 'Bearer $oldToken'},
      );
      await saveUserToken(loginResponse.data['access_token']);
      await SharedPrefHelper.storeCurrentDate();

      return Right(null);
    } on DioException catch (e) {
      return Left(
        FailureService.fromDioException(
          dioExecption: e,
          statusCode: e.response?.statusCode,
          dioExecptionType: e.type,
        ),
      );
    } catch (e) {
      return Left(FailureService(e.toString()));
    }
  }
}

Future<void> saveUserToken(String token) async {
  await SharedPrefHelper.setSecuredString(SharedPrefKeys.employeeToken, token);
}
