import 'package:dio/dio.dart';
// ignore: implementation_imports
import 'package:either_dart/src/either.dart';
import 'package:hrmatrix/core/errors/failure_service.dart';
import 'package:hrmatrix/core/networking/api_service.dart';
import 'package:hrmatrix/features/profile_pt1/data/models/get_loans_model/get_loans_model.dart';
import 'package:hrmatrix/features/profile_pt1/data/repo/profile_pt1_repo.dart';

import '../../../../core/helper/constants.dart';
import '../../../../core/helper/shard_pref_helper.dart';
import '../../../../core/networking/api_endpoints.dart';

class ProfilePt1RepoImpl extends ProfilePt1Repo {
  final ApiService apiService;

  ProfilePt1RepoImpl({required this.apiService});
  @override
  Future<Either<FailureService, GetMyLoansModel>> getMyLoans() async {
    try {
      String token = await SharedPrefHelper.getSecuredString(
        SharedPrefKeys.employeeToken,
      );
      Response response = await apiService.get(
        endpoint: ApiEndpoints.getMyLoans,
        headers: {'Authorization': 'Bearer $token'},
      );

      return Right(GetMyLoansModel.fromJson(response.data));
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
