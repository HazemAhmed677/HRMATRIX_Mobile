import 'package:dio/dio.dart';
import 'package:hrmatrix/core/networking/api_structure.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );
    final response = await _dio.get(
      '${ApiStructure.baseURL}$endpoint',
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
    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );
    final response = await _dio.post(
      '${ApiStructure.baseURL}$endpoint',
      data: data,
      options: Options(headers: headers),
    );
    return response;
  }

  Future<Response> put({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) {
    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );
    final response = _dio.put(
      '${ApiStructure.baseURL}$endpoint',
      data: data,
      options: Options(headers: headers),
    );
    return response;
  }

  Future<Response> delete({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) async {
    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );
    final response = await _dio.delete(
      '${ApiStructure.baseURL}$endpoint',
      data: data,
      options: Options(headers: headers),
    );
    return response;
  }
}
