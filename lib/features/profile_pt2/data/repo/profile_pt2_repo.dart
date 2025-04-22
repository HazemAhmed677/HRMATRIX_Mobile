import 'package:either_dart/either.dart';
import 'package:hrmatrix/core/errors/failure_service.dart';
import 'package:hrmatrix/features/profile_pt2/data/models/get_my_air_tickets_model/get_my_air_tickets_model.dart';

abstract class ProfilePt2Repo {
  Future<Either<FailureService, GetMyAirTicketsModel>> getMyAirTickets();
}
