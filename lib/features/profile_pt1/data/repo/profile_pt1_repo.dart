import 'package:either_dart/either.dart';
import 'package:hrmatrix/features/profile_pt1/data/models/get_my_document_model/get_my_document_model.dart';
import 'package:hrmatrix/features/profile_pt1/data/models/get_my_loans_model/get_my_loans_model.dart';

import '../../../../core/errors/failure_service.dart';

abstract class ProfilePt1Repo {
  Future<Either<FailureService, GetMyLoansModel>> getMyLoans();

  Future<Either<FailureService, List<GetMyDocumentModel>>> getMyDocument();
}
