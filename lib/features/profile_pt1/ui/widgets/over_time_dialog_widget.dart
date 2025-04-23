import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hrmatrix/core/di/set_up.dart';
import 'package:hrmatrix/core/helpers/show_top_snack_bar.dart';
import 'package:hrmatrix/core/helpers/spacing.dart';
import 'package:hrmatrix/core/theming/app_color.dart';
import 'package:hrmatrix/core/widgets/custom_logout_button.dart';
import 'package:hrmatrix/core/widgets/custom_text_form_field.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/over_time_hours.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/over_time_start_date.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../core/helpers/logger.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/close_widget.dart';
import '../../../requests/data/models/over_time_request_model.dart';
import '../../../requests/data/repo/request_repo_impl.dart';
import '../../../requests/logic/post_over_time_request/post_over_time_cubit.dart';
import '../../../requests/ui/widgets/document_dialog_expiration_date.dart';
import '../../../requests/ui/widgets/helpers/show_calendar_dialog.dart';

class OverTimeDialogWidget extends StatefulWidget {
  const OverTimeDialogWidget({super.key});

  @override
  State<OverTimeDialogWidget> createState() => _OverTimeDialogWidgetState();
}

class _OverTimeDialogWidgetState extends State<OverTimeDialogWidget> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  DateTime? _selectedDate;
  TimeOfDay? selectedTime1;
  TimeOfDay? selectedTime2;
  String? time1Error;
  String? time2Error;
  String get formattedDate {
    if (_selectedDate == null) return '';
    return _formatDate(_selectedDate!);
  }

  String _formatDate(DateTime date) {
    return "${_getWeekdayName(date.weekday)} ${_twoDigits(date.day)}/${_twoDigits(date.month)}/${date.year}";
  }

  String _twoDigits(int n) => n.toString().padLeft(2, '0');

  String _getWeekdayName(int weekday) {
    const names = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    return names[weekday - 1];
  }

  void _pickDate() async {
    final picked = await showTableCalendarDialog(context);
    if (picked != null && picked is DateTime) {
      setState(() {
        _selectedDate = picked;
      });
    }
    loggerError(_selectedDate.toString());
  }

  Future<void> _pickTime1() async {
    final now = TimeOfDay.now();
    final picked = await showTimePicker(
      context: context,
      initialTime: selectedTime1 ?? now,
    );

    if (picked != null) {
      setState(() {
        selectedTime1 = picked;
      });
    }
  }

  Future<void> _pickTime2() async {
    final now = TimeOfDay.now();
    final picked = await showTimePicker(
      context: context,
      initialTime: selectedTime2 ?? now,
    );

    if (picked != null) {
      setState(() {
        selectedTime2 = picked;
      });
    }
  }

  String _formatTime(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat.jm().format(dt); // e.g., 5:08 PM
  }

  String _formatTimeForModel(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat.Hms().format(dt); // Returns "01:00:00"
  }

  String desc = '';
  final OverTimeRequestModel overTimeRequestModel = OverTimeRequestModel();
  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return BlocProvider(
      create:
          (context) =>
              PostOverTimeCubit(requestRepoImpl: getIt.get<RequestRepoImpl>()),
      child: Builder(
        builder: (context) {
          return Provider(
            create: (BuildContext context) => overTimeRequestModel,
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Request New Over Time",
                              style: AppStyles.primaryStyle.copyWith(
                                fontSize: isLandscape ? 12.sp : 16.sp,
                              ),
                            ),
                            isLandscape ? verticalSpace(8) : verticalSpace(4),
                            Text(
                              "Submit a new overtime request.",
                              style: AppStyles.secondaryStyle.copyWith(
                                fontSize: isLandscape ? 7.sp : 12.sp,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        CloseWidget(),
                      ],
                    ),
                    isLandscape ? verticalSpace(38) : verticalSpace(18),
                    CustomTextFormField(
                      hint: 'Enter Description',
                      label: "Description",
                      maxLines: 2,
                      onChanged: (p0) {
                        desc = p0;
                      },
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return 'Description is required';
                        }
                        return null;
                      },
                    ),
                    isLandscape ? verticalSpace(48) : verticalSpace(28),
                    OverTimeHours(),
                    isLandscape ? verticalSpace(48) : verticalSpace(28),
                    DocumentDialogExpirationDate(
                      hint:
                          _selectedDate != null ? formattedDate : 'Select Date',
                      label: 'Over Time Date',
                      onTap: _pickDate,
                      validator: (value) {
                        if (_selectedDate == null) {
                          return 'Date is required';
                        }
                        return null;
                      },
                    ),
                    isLandscape ? verticalSpace(48) : verticalSpace(28),
                    OverTimeStartAndEndDate(
                      title: 'Start Time',
                      hint:
                          selectedTime1 == null
                              ? 'Select Time'
                              : _formatTime(selectedTime1!),
                      onTap: _pickTime1,
                      errorText: time1Error,
                    ),
                    isLandscape ? verticalSpace(48) : verticalSpace(28),
                    OverTimeStartAndEndDate(
                      title: 'End Time',
                      hint:
                          selectedTime2 == null
                              ? 'Select Time'
                              : _formatTime(selectedTime2!),
                      onTap: _pickTime2,
                      errorText: time2Error,
                    ),
                    isLandscape ? verticalSpace(52) : verticalSpace(32),
                    Row(
                      children: [
                        Expanded(
                          child: CustomActionButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            text: 'Cancel',
                            edgeColor: AppColors.grey300,
                            backgroundColor: AppColors.white,
                            textColor: AppColors.black,
                            fontSize: isLandscape ? 8 : 12,
                            overlayColor: AppColors.customActionButton,
                            size: Size(
                              MediaQuery.sizeOf(context).width,
                              isLandscape ? 90.h : 40.h,
                            ),
                          ),
                        ),
                        horizontalSpace(12),
                        BlocConsumer<PostOverTimeCubit, PostOverTimeState>(
                          listener: (context, state) {
                            if (state is PostOverTimeSuccess) {
                              context.pop();
                              showSuccessSnackBar(
                                context: context,
                                e: 'Over Time Requested',
                                backgroundColor: AppColors.blue,
                              );
                            } else if (state is PostOverTimeFailure) {
                              showErrorSnackBar(
                                context: context,
                                e: state.errorMsg,
                                backgroundColor: AppColors.red,
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is PostOverTimeLoading) {
                              return Center(
                                child: const CircularProgressIndicator(
                                  color: AppColors.blue,
                                ),
                              );
                            }
                            return Expanded(
                              child: CustomActionButton(
                                onPressed: () async {
                                  final isTime1Valid = selectedTime1 != null;
                                  final isTime2Valid = selectedTime2 != null;

                                  setState(() {
                                    time1Error =
                                        isTime1Valid
                                            ? null
                                            : 'Please select start time';
                                    time2Error =
                                        isTime2Valid
                                            ? null
                                            : 'Please select end time';
                                  });
                                  if (formKey.currentState!.validate() &&
                                      (overTimeRequestModel.overTime != null &&
                                          overTimeRequestModel.overTime != 0)) {
                                    overTimeRequestModel.content = desc;
                                    overTimeRequestModel.overTimeDate =
                                        "${_selectedDate!.year}-${_twoDigits(_selectedDate!.month)}-${_twoDigits(_selectedDate!.day)}";
                                    overTimeRequestModel.overTimeStart =
                                        _formatTimeForModel(selectedTime1!);
                                    overTimeRequestModel.overTimeEnd =
                                        _formatTimeForModel(selectedTime2!);

                                    await BlocProvider.of<PostOverTimeCubit>(
                                      context,
                                    ).postOverTime(
                                      overtimeRequestModel:
                                          overTimeRequestModel,
                                    );
                                  } else {
                                    setState(() {
                                      autovalidateMode =
                                          AutovalidateMode.always;
                                    });
                                  }
                                },
                                text: 'Request Over Time',
                                edgeColor: AppColors.customActionButton,
                                backgroundColor: AppColors.customActionButton,
                                textColor: AppColors.white,
                                overlayColor: AppColors.white,
                                size: Size(
                                  MediaQuery.sizeOf(context).width,
                                  isLandscape ? 90.h : 36.h,
                                ),
                                verticalPadding: isLandscape ? 0 : 4,
                                fontSize: isLandscape ? 8 : 12,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
