import 'package:dio/dio.dart';
// ignore: implementation_imports
import 'package:either_dart/src/either.dart';
import 'package:hrmatrix/core/errors/failure_service.dart';
import 'package:hrmatrix/core/networking/api_service.dart';
import 'package:hrmatrix/features/profile_pt1/data/models/get_my_asset_model/get_my_asset_model.dart';
import 'package:hrmatrix/features/profile_pt1/data/models/get_my_document_model/get_my_document_model.dart';
import 'package:hrmatrix/features/profile_pt1/data/models/get_my_loans_model/get_my_loans_model.dart';
import 'package:hrmatrix/features/profile_pt1/data/repo/profile_pt1_repo.dart';

import '../../../../core/helper/load_token.dart';
import '../../../../core/networking/api_endpoints.dart';

class ProfilePt1RepoImpl extends ProfilePt1Repo {
  final ApiService apiService;

  ProfilePt1RepoImpl({required this.apiService});
  @override
  Future<Either<FailureService, GetMyLoansModel>> getMyLoans() async {
    try {
      String token = await loadToken();
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

  @override
  Future<Either<FailureService, List<GetMyDocumentModel>>>
  getMyDocuments() async {
    try {
      String token = await loadToken();

      Response response = await apiService.get(
        endpoint: ApiEndpoints.getMyDocuments,
        headers: {'Authorization': 'Bearer $token'},
      );

      final List<dynamic> jsonList = response.data;
      final documents =
          jsonList.map((json) => GetMyDocumentModel.fromJson(json)).toList();

      return Right(documents);
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
  Future<Either<FailureService, List<GetMyAssetModel>>> getMyAssets() async {
    try {
      String token = await loadToken();

      Response response = await apiService.get(
        endpoint: ApiEndpoints.getMyAssets,
        headers: {'Authorization': 'Bearer $token'},
      );

      final List<dynamic> jsonList = response.data;
      final assets =
          jsonList.map((json) => GetMyAssetModel.fromJson(json)).toList();

      return Right(assets);
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
