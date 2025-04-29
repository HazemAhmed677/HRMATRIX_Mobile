import 'package:either_dart/either.dart';
import 'package:hrmatrix/core/errors/failure_service.dart';
import 'package:hrmatrix/features/profile_pt2/data/models/get_my_air_tickets_model/get_my_air_tickets_model.dart';
import 'package:hrmatrix/features/profile_pt2/data/models/get_my_contracts_model/get_my_contracts_model.dart';
import 'package:hrmatrix/features/profile_pt2/data/models/get_my_financial_transaction_model/get_my_financial_transaction_model.dart';

import '../models/get_my_disciplinary_ations_model/get_my_disciplinary_ations_model.dart';
import '../models/get_my_requests_model/get_my_requests_model.dart';

abstract class ProfilePt2Repo {
  Future<Either<FailureService, GetMyAirTicketsModel>> getMyAirTickets();

  Future<Either<FailureService, GetMyFinancialTransactionModel>>
  getMyFinancialTransaction();
  Future<Either<FailureService, GetMyRequestsModel>> getMyRequestsOff();

  Future<Either<FailureService, List<GetMyDisciplinaryAtionsModel>>>
  getMyDisciplinaryActions();
  Future<Either<FailureService, GetMyContractsModel>> getMyContracts();
}
