import 'package:either_dart/either.dart';
import 'package:hrmatrix/features/profile_pt1/data/models/get_loans_model/get_loans_model.dart';

import '../../../../core/errors/failure_service.dart';

abstract class ProfilePt1Repo {
  Future<Either<FailureService, GetMyLoansModel>> getMyLoans();
}
