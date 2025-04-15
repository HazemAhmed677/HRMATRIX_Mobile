import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/theming/app_styles.dart';

class DocumentDialogDropDown extends StatefulWidget {
  const DocumentDialogDropDown({super.key});

  @override
  State<DocumentDialogDropDown> createState() => _DocumentDialogDropDownState();
}

class _DocumentDialogDropDownState extends State<DocumentDialogDropDown> {
  String? _selectedValue;
  final List<String> _documentTypes = [
    'Graduation Certificate',
    'ID',
    'Personal Info',
    'Military Certificate',
    'Passport',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1.5),
      ),
      child: DropdownButtonFormField<String>(
        value: _selectedValue,
        hint: Text(
          'Select a document type',
          style: AppStyles.boldNoColor18.copyWith(fontSize: 8.sp),
        ),
        icon: Icon(Icons.arrow_drop_down, size: 10.sp),
        elevation: 2,
        style: AppStyles.boldNoColor18.copyWith(fontSize: 8.sp),
        dropdownColor: Colors.white,
        borderRadius: BorderRadius.circular(8),
        items:
            _documentTypes.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 8.sp,
                    color: const Color(0xFF374151),
                  ),
                ),
              );
            }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            _selectedValue = newValue;
          });
        },
        validator: (value) {
          if (value == null) {
            return 'Please select a document type';
          }
          return null;
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 16.h,
          ),
          errorStyle: TextStyle(fontSize: 12.sp, color: Colors.redAccent),
        ),
      ),
    );
  }
}
