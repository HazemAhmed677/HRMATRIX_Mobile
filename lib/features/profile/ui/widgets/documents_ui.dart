import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hrmatrix/features/profile/ui/widgets/documents_table.dart';
import 'package:hrmatrix/features/profile/ui/widgets/profile_common_top_container.dart';

import '../../../../core/helper/spacing.dart';

class DocumentsUI extends StatefulWidget {
  const DocumentsUI({super.key});

  @override
  State<DocumentsUI> createState() => _DocumentsUIState();
}

class _DocumentsUIState extends State<DocumentsUI> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfileCommonTopContainer(),
        verticalSpace(18),
        DocumentsTable(),
      ],
    );
  }
}
