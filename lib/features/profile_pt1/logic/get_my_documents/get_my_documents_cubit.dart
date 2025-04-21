import 'package:bloc/bloc.dart';
import 'package:hrmatrix/features/profile_pt1/data/models/get_my_document_model/get_my_document_model.dart';

import '../../data/repo/profile_pt1_repo_impl.dart';

part 'get_my_documents_state.dart';

class GetMyDocumentsCubit extends Cubit<GetMyDocumentsState> {
  final ProfilePt1RepoImpl profilePt1RepoImpl;

  GetMyDocumentsCubit({required this.profilePt1RepoImpl})
    : super(GetMyDocumentsInitial());

  Future<void> getMyDocuments() async {
    if (isClosed) return;

    emit(GetMyDocumentsLoading());

    final result = await profilePt1RepoImpl.getMyDocuments();

    result.fold(
      (failureService) {
        if (!isClosed) {
          emit(GetMyDocumentsFailure(errorMsg: failureService.errorMsg));
        }
      },
      (right) {
        if (!isClosed) {
          emit(GetMyDocumentsSuccess(getMyDocumentsList: right));
        }
      },
    );
  }
}
