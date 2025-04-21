part of 'get_my_documents_cubit.dart';

sealed class GetMyDocumentsState {}

final class GetMyDocumentsInitial extends GetMyDocumentsState {}

final class GetMyDocumentsLoading extends GetMyDocumentsState {}

final class GetMyDocumentsSuccess extends GetMyDocumentsState {
  final List<GetMyDocumentModel> getMyDocumentsList;

  GetMyDocumentsSuccess({required this.getMyDocumentsList});
}

final class GetMyDocumentsFailure extends GetMyDocumentsState {
  final String errorMsg;

  GetMyDocumentsFailure({required this.errorMsg});
}
