import 'package:dio/dio.dart';
import 'package:either_dart/src/either.dart';
import 'package:hrmatrix/core/errors/failure_service.dart';
import 'package:hrmatrix/features/profile_pt2/data/models/get_my_air_tickets_model/get_my_air_tickets_model.dart';
import 'package:hrmatrix/features/profile_pt2/data/models/get_my_disciplinary_ations_model/get_my_disciplinary_ations_model.dart';
import 'package:hrmatrix/features/profile_pt2/data/models/get_my_financial_transaction_model/get_my_financial_transaction_model.dart';
import 'package:hrmatrix/features/profile_pt2/data/models/get_my_requests_model/get_my_requests_model.dart';
import 'package:hrmatrix/features/profile_pt2/data/repo/profile_pt2_repo.dart';

import '../../../../core/helpers/load_token.dart';
import '../../../../core/networking/api_endpoints.dart';
import '../../../../core/networking/api_service.dart';

class ProfilePt2RepoImpl extends ProfilePt2Repo {
  final ApiService apiService;

  ProfilePt2RepoImpl({required this.apiService});
  @override
  Future<Either<FailureService, GetMyAirTicketsModel>> getMyAirTickets() async {
    try {
      String token = await loadToken();
      Response response = await apiService.get(
        endpoint: ApiEndpoints.getMyAirTickets,
        headers: {'Authorization': 'Bearer $token'},
      );
      return Right(GetMyAirTicketsModel.fromJson(response.data));
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
  Future<Either<FailureService, GetMyFinancialTransactionModel>>
  getMyFinancialTransaction() async {
    try {
      String token = await loadToken();
      Response response = await apiService.get(
        endpoint: ApiEndpoints.getMyFinancialTransactions,
        headers: {'Authorization': 'Bearer $token'},
      );
      return Right(GetMyFinancialTransactionModel.fromJson(response.data));
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
  Future<Either<FailureService, GetMyRequestsModel>> getMyTimeOff() async {
    try {
      String token = await loadToken();
      Response response = await apiService.get(
        endpoint: ApiEndpoints.getMyRequests,
        headers: {'Authorization': 'Bearer $token'},
      );
      return Right(GetMyRequestsModel.fromJson(response.data));
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
  Future<Either<FailureService, List<GetMyDisciplinaryAtionsModel>>>
  getMyDisciplinaryActions() async {
    try {
      String token = await loadToken();

      Response response = await apiService.get(
        endpoint: ApiEndpoints.getMyDisciplinaryAtions,
        headers: {'Authorization': 'Bearer $token'},
      );

      final List<dynamic> jsonList = response.data;
      final disciplinaryActions =
          jsonList
              .map((json) => GetMyDisciplinaryAtionsModel.fromJson(json))
              .toList();

      return Right(disciplinaryActions);
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
