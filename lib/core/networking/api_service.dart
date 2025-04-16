import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:hrmatrix/core/errors/failure_service.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final response = await _dio.get(
      endpoint,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
    return response;
  }

  Future<Response> post({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) async {
    final response = await _dio.post(
      endpoint,
      data: data,
      options: Options(headers: headers),
    );
    return response;
  }

  Future<Either<FailureService, Response>> delete({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) async {
    final response = await _dio.delete(
      endpoint,
      data: data,
      options: Options(headers: headers),
    );
    return Right(response);
  }
}
