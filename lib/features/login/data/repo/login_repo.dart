import 'package:either_dart/either.dart';
import 'package:hrmatrix/core/errors/failure_service.dart';
import 'package:hrmatrix/features/login/data/models/employee_model.dart';

abstract class LoginRepo {
  Future<Either<FailureService, EmployeeModel>> login({
    required String email,
    required String password,
  });
  // Future<Either<FailureService, EmployeeModel>> getEmployee({
  //   required String token,
  // });
}
