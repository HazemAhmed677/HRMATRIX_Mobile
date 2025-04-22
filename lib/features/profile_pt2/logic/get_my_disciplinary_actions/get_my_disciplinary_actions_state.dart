part of 'get_my_disciplinary_actions_cubit.dart';

sealed class GetMyDisciplinaryActionsState {}

final class GetMyDisciplinaryActionsInitial
    extends GetMyDisciplinaryActionsState {}

final class GetMyDisciplinaryActionsLoading
    extends GetMyDisciplinaryActionsState {}

final class GetMyDisciplinaryActionsSuccess
    extends GetMyDisciplinaryActionsState {
  final List<GetMyDisciplinaryAtionsModel> getMyDisciplinaryActionsList;

  GetMyDisciplinaryActionsSuccess({required this.getMyDisciplinaryActionsList});
}

final class GetMyDisciplinaryActionsFailure
    extends GetMyDisciplinaryActionsState {
  final String errorMsg;

  GetMyDisciplinaryActionsFailure({required this.errorMsg});
}
