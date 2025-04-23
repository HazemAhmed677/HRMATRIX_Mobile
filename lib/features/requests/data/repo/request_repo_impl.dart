import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:hrmatrix/core/errors/failure_service.dart';
import 'package:hrmatrix/core/networking/api_service.dart';
import 'package:hrmatrix/features/auth/data/models/employee_model/over_time_request_model.dart';
import 'package:hrmatrix/features/requests/data/models/time_off_request_models.dart';
import 'package:hrmatrix/features/requests/data/repo/request_repo.dart';

import '../../../../core/helpers/load_token.dart';
import '../../../../core/networking/api_endpoints.dart';

class RequestRepoImpl extends RequestRepo {
  final ApiService apiService;

  RequestRepoImpl({required this.apiService});
  @override
  Future<Either<FailureService, void>> sentTimeOffRequest({
    required TimeOffRequestModel timeOffRequestModel,
  }) async {
    try {
      String token = await loadToken();
      await apiService.post(
        endpoint: ApiEndpoints.postRequest,
        data: timeOffRequestModel.toJson(),
        headers: {'Authorization': 'Bearer $token'},
      );
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

  @override
  Future<Either<FailureService, void>> sentOverTimeRequest({
    required OverTimeRequestModel overTimeRequestModel,
  }) async {
    try {
      String token = await loadToken();
      await apiService.post(
        endpoint: ApiEndpoints.postRequest,
        data: overTimeRequestModel.toJson(),
        headers: {'Authorization': 'Bearer $token'},
      );
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
