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
import 'package:hrmatrix/features/profile_pt1/ui/widgets/over_time_start_date.dart';
import 'package:hrmatrix/features/requests/data/models/time_off_request_models.dart';
import 'package:hrmatrix/features/requests/data/repo/request_repo_impl.dart';
import 'package:intl/intl.dart';

import '../../../../core/helpers/logger.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/close_widget.dart';
import '../../../requests/logic/post_time_off_request/post_time_off_cubit.dart';
import '../../../requests/ui/widgets/document_dialog_expiration_date.dart';
import '../../../requests/ui/widgets/helpers/show_calendar_dialog.dart';

class TimeOffDialog extends StatefulWidget {
  const TimeOffDialog({super.key});

  @override
  State<TimeOffDialog> createState() => _TimeOffDialogState();
}

class _TimeOffDialogState extends State<TimeOffDialog> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final TimeOffRequestModel timeOffRequestModel = TimeOffRequestModel();

  DateTime? _selectedDate;
  TimeOfDay? selectedTime1;
  TimeOfDay? selectedTime2;

  String? timeFromError;
  String? timeToError;

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

  void _pickDate(BuildContext context) async {
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

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return BlocProvider(
      create:
          (context) =>
              PostTimeOffCubit(requestRepoImpl: getIt.get<RequestRepoImpl>()),
      child: Builder(
        builder: (context) {
          return Form(
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
                            "Add Time Off Request",
                            style: AppStyles.primaryStyle.copyWith(
                              fontSize: isLandscape ? 12.sp : 16.sp,
                            ),
                          ),
                          isLandscape ? verticalSpace(8) : verticalSpace(4),
                          Text(
                            "Add a new time off request.",
                            style: AppStyles.secondaryStyle.copyWith(
                              fontSize: isLandscape ? 7.sp : 12.sp,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      const CloseWidget(),
                    ],
                  ),
                  isLandscape ? verticalSpace(38) : verticalSpace(18),
                  DocumentDialogExpirationDate(
                    onTap: () => _pickDate(context),
                    label: 'Time Off Date',
                    validator: (value) {
                      if (_selectedDate == null) {
                        return 'Time off date is required';
                      }
                      return null;
                    },
                    hint: _selectedDate != null ? formattedDate : 'DD/MM/YY',
                  ),
                  isLandscape ? verticalSpace(48) : verticalSpace(28),
                  Row(
                    children: [
                      Expanded(
                        child: OverTimeStartAndEndDate(
                          title: 'From Hour',
                          hint:
                              selectedTime1 == null
                                  ? 'From'
                                  : _formatTime(selectedTime1!),
                          onTap: _pickTime1,
                          errorText: timeFromError,
                        ),
                      ),
                      horizontalSpace(10),
                      Expanded(
                        child: OverTimeStartAndEndDate(
                          title: 'To Hour',
                          hint:
                              selectedTime2 == null
                                  ? 'To'
                                  : _formatTime(selectedTime2!),
                          onTap: _pickTime2,
                          errorText: timeToError,
                        ),
                      ),
                    ],
                  ),
                  isLandscape ? verticalSpace(48) : verticalSpace(28),
                  CustomTextFormField(
                    hint: '',
                    label: "Content",
                    maxLines: 2,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Content is required';
                      }
                      return null;
                    },
                    onChanged: (desc) {
                      timeOffRequestModel.content = desc;
                    },
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
                          overlayColor: AppColors.customActionButton,
                          size: Size(
                            MediaQuery.sizeOf(context).width,
                            isLandscape ? 90.h : 40.h,
                          ),
                          fontSize: isLandscape ? 8 : 12,
                        ),
                      ),
                      horizontalSpace(12),
                      Expanded(
                        child: BlocConsumer<PostTimeOffCubit, PostTimeOffState>(
                          listener: (context, state) {
                            if (state is PostTimeOffSuccess) {
                              context.pop();
                              showSuccessSnackBar(
                                context: context,
                                e: 'Time Off Request Added',
                                backgroundColor: AppColors.blue,
                              );
                            } else if (state is PostTimeOffFailure) {
                              showErrorSnackBar(
                                context: context,
                                e: state.errorMsg,
                                backgroundColor: AppColors.red,
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is PostTimeOffLoading) {
                              return CircularProgressIndicator(
                                color: AppColors.blue,
                              );
                            }
                            return CustomActionButton(
                              verticalPadding: isLandscape ? 0 : 4,
                              onPressed: () async {
                                final isTimeFromValid = selectedTime1 != null;
                                final isTimeToValid = selectedTime2 != null;

                                setState(() {
                                  timeFromError =
                                      isTimeFromValid
                                          ? null
                                          : 'Please select start time';
                                  timeToError =
                                      isTimeToValid
                                          ? null
                                          : 'Please select end time';
                                });

                                if (formKey.currentState!.validate() &&
                                    isTimeFromValid &&
                                    isTimeToValid) {
                                  timeOffRequestModel.timeOffDate =
                                      "${_selectedDate!.year}-${_twoDigits(_selectedDate!.month)}-${_twoDigits(_selectedDate!.day)}";
                                  timeOffRequestModel.fromHour =
                                      _formatTimeForModel(selectedTime1!);
                                  timeOffRequestModel.toHour =
                                      _formatTimeForModel(selectedTime2!);

                                  await BlocProvider.of<PostTimeOffCubit>(
                                    context,
                                  ).postTimeOff(
                                    timeOffRequestModel: timeOffRequestModel,
                                  );
                                } else {
                                  setState(() {
                                    autovalidateMode = AutovalidateMode.always;
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
                              fontSize: isLandscape ? 8 : 12,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
