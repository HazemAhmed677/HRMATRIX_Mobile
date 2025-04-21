import 'package:flutter/material.dart';
import 'package:hrmatrix/features/profile_pt1/data/models/get_my_document_model/get_my_document_model.dart';

import '../../../../core/theming/app_color.dart';

class DocTable extends StatelessWidget {
  const DocTable({super.key, required this.documents});

  final List<GetMyDocumentModel> documents;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(3),
          2: FlexColumnWidth(2),
          3: FlexColumnWidth(1.5),
          4: FlexColumnWidth(1.2),
          5: FlexColumnWidth(1.2),
        },
        border: TableBorder.symmetric(
          inside: BorderSide(color: Colors.grey.shade300),
        ),
        children: [
          // Header row
          TableRow(
            decoration: BoxDecoration(color: Colors.grey.shade200),
            children: const [
              Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  'Title',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  'Description',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  'Expire Date',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  'Status',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  'Preview',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  'Delete',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),

          // Data rows
          ...documents.map((doc) {
            final bool isExpired =
                DateTime.tryParse(
                  doc.expirationDate ?? '',
                )?.isBefore(DateTime.now()) ??
                false;
            final bool isApproved = doc.status?.toLowerCase() == 'Approved';

            return TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(doc.title ?? ''),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(doc.description ?? ''),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(doc.expirationDate?.split('T').first ?? ''),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      doc.status ?? '',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Icon(Icons.insert_drive_file, color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child:
                      isApproved
                          ? Icon(Icons.delete, color: Colors.redAccent)
                          : const SizedBox.shrink(),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
