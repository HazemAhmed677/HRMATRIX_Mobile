import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrmatrix/features/profile_pt1/logic/get_my_documents/get_my_documents_cubit.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/common_container_profile.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/doc_table.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/loading_widget.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/no_data_available.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/profile_common_row.dart';
import 'package:hrmatrix/features/requests/ui/widgets/helpers/profile_common_dialog.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_search_text_field.dart';
import '../../../requests/ui/widgets/document_add_dialog_widget.dart';

class DocumentsTableContainer extends StatefulWidget {
  const DocumentsTableContainer({super.key});

  @override
  State<DocumentsTableContainer> createState() =>
      _DocumentsTableContainerState();
}

class _DocumentsTableContainerState extends State<DocumentsTableContainer> {
  @override
  void initState() {
    BlocProvider.of<GetMyDocumentsCubit>(context).getMyDocuments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CommonContainerProfile(
      child: Column(
        children: [
          CustomSearchTextFeild(
            readOnly: false,
            hintText: 'Search documents...',
          ),
          verticalSpace(28),
          if (MediaQuery.of(context).orientation == Orientation.landscape)
            ProfileCommonRow(
              text: 'Add Document',
              onPressed: () {
                showProfileCommonDialog(
                  context: context,
                  child: DocumentAddDialogWidget(),
                );
              },
            ),
          verticalSpace(28),
          BlocBuilder<GetMyDocumentsCubit, GetMyDocumentsState>(
            builder: (context, state) {
              if (state is GetMyDocumentsLoading) {
                return LoadingWidget();
              } else if (state is GetMyDocumentsSuccess) {
                if (state.getMyDocumentsList.isEmpty) {
                  return NoDataAvailable();
                }
                return DocTable(documents: state.getMyDocumentsList);
              } else if (state is GetMyDocumentsFailure) {
                return Center(child: Text(state.errorMsg));
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
