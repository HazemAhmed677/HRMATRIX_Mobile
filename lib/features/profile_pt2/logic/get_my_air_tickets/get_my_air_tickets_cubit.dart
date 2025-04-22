import 'package:bloc/bloc.dart';
import 'package:hrmatrix/features/profile_pt2/data/models/get_my_air_tickets_model/get_my_air_tickets_model.dart';

import '../../data/repo/profile_pt2_repo_impl.dart';

part 'get_my_air_tickets_state.dart';

class GetMyAirTicketsCubit extends Cubit<GetMyAirTicketsState> {
  final ProfilePt2RepoImpl profilePt2RepoImpl;

  GetMyAirTicketsCubit({required this.profilePt2RepoImpl})
    : super(GetMyAirTicketsInitial());

  Future<void> getMyAirTickets() async {
    if (isClosed) return;

    emit(GetMyAirTicketsLoading());

    final result = await profilePt2RepoImpl.getMyAirTickets();

    result.fold(
      (failureService) {
        if (!isClosed) {
          emit(GetMyAirTicketsFailure(errorMsg: failureService.errorMsg));
        }
      },
      (right) {
        if (!isClosed) {
          emit(GetMyAirTicketsSuccess(getMyAirTicketsModel: right));
        }
      },
    );
  }
}
