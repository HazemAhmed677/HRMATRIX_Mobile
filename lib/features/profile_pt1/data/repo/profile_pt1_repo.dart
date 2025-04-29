import 'package:either_dart/either.dart';
import 'package:hrmatrix/features/auth/data/models/employee_model/employee_model.dart';
import 'package:hrmatrix/features/profile_pt1/data/models/edit_profile_request_model.dart';
import 'package:hrmatrix/features/profile_pt1/data/models/get_my_document_model/get_my_document_model.dart';
import 'package:hrmatrix/features/profile_pt1/data/models/get_my_loans_model/get_my_loans_model.dart';

import '../../../../core/errors/failure_service.dart';
import '../models/get_my_asset_model/get_my_asset_model.dart';
import '../models/reset_passwrd_request.dart';

abstract class ProfilePt1Repo {
  Future<Either<FailureService, void>> resetPassword({
    required ResetPasswrdRequestModel resetPasswordModel,
  });

  Future<Either<FailureService, EmployeeModel>> editProfile({
    required EditProfileRequestModel editProfileRequestModel,
  });
  Future<Either<FailureService, GetMyLoansModel>> getMyLoans();

  Future<Either<FailureService, List<GetMyDocumentModel>>> getMyDocuments();

  Future<Either<FailureService, List<GetMyAssetModel>>> getMyAssets();
}
