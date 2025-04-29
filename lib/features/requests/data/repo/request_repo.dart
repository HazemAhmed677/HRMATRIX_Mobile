import 'package:either_dart/either.dart';
import 'package:hrmatrix/core/errors/failure_service.dart';

import '../models/over_time_request_model.dart';
import '../models/time_off_request_models.dart';

abstract class RequestRepo {
  Future<Either<FailureService, void>> sentTimeOffRequest({
    required TimeOffRequestModel timeOffRequestModel,
  });
  Future<Either<FailureService, void>> sentOverTimeRequest({
    required OverTimeRequestModel overTimeRequestModel,
  });
}
