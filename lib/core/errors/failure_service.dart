// ignore: depend_on_referenced_packages
import 'dart:math';

import 'package:dio/dio.dart';

class FailureService {
  final String errorMsg;

  FailureService(this.errorMsg);

  factory FailureService.fromDioException({
    required DioException dioExecption,
    required DioExceptionType dioExecptionType,
    int? statusCode,
  }) {
    switch (dioExecptionType) {
      case DioExceptionType.connectionTimeout:
        return FailureService('Connection timeout, Please try again');
      case DioExceptionType.sendTimeout:
        return FailureService('Send timeout, Check your network');
      case DioExceptionType.receiveTimeout:
        return FailureService('Receive timeout, Check your network');
      case DioExceptionType.badCertificate:
        return FailureService('Bad certificate, Please try later');
      case DioExceptionType.badResponse:
        return FailureService.fromBadResponse(
          statusCode: statusCode,
          dioExecption: dioExecption,
        );
      case DioExceptionType.cancel:
        return FailureService('Request to server was canceled');
      case DioExceptionType.connectionError:
        return FailureService('No Internet connection');
      case DioExceptionType.unknown:
        return FailureService(dioExecptionType.name);
      // ignore: unreachable_switch_default
      default:
        return FailureService('Oops, there something wrong!');
    }
  }
  factory FailureService.fromBadResponse({
    int? statusCode,
    required DioException dioExecption,
  }) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return FailureService(
        dioExecption.response?.data['message'] ?? 'Something went wrong',
      );
    } else if (statusCode == 404) {
      return FailureService(dioExecption.response!.data['message']);
    } else {
      return FailureService(e.toString());
    }
  }
}
