import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/helper/spacing.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:lucide_icons/lucide_icons.dart';

class DocumentDialogChooseOne extends StatefulWidget {
  const DocumentDialogChooseOne({super.key, this.text = "Upload a document"});
  final String text;
  @override
  State<DocumentDialogChooseOne> createState() =>
      _DocumentDialogChooseOneState();
}

class _DocumentDialogChooseOneState extends State<DocumentDialogChooseOne> {
  File? pickedPdf;

  Future<void> _pickPdfFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        pickedPdf = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickPdfFile,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        padding: EdgeInsets.all(18.w),
        decoration: BoxDecoration(
          color: AppColors.dropFilledColor,
          border: Border.all(color: const Color(0xFFD1D5DB)), // grey300
          borderRadius: BorderRadius.circular(44.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              LucideIcons.fileDown,
              size: 22.sp,
              color: const Color(0xFF6B7280), // grey500
            ),
            verticalSpace(12.h),
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 8.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            verticalSpace(12.h),
            Text(
              pickedPdf == null
                  ? "Click to browse a PDF file"
                  : pickedPdf!.path.split('/').last,
              style: TextStyle(
                fontSize: 7.sp,
                color: const Color(0xFF9CA3AF), // grey600
              ),
            ),
          ],
        ),
      ),
    );
  }
}
