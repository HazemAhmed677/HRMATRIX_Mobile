import 'package:either_dart/either.dart';
import 'package:hrmatrix/core/errors/failure_service.dart';

import '../models/employee_model/employee_model.dart';

abstract class LoginRepo {
  Future<Either<FailureService, EmployeeModel>> login({
    required String email,
    required String password,
  });
}
