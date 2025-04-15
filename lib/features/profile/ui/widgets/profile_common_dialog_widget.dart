import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hrmatrix/core/theming/app_color.dart';

class ProfileCommonDialogWidget extends StatefulWidget {
  const ProfileCommonDialogWidget({
    super.key,
    required this.child,
    required this.context,
  });
  final Widget child;
  final BuildContext context;
  @override
  State<ProfileCommonDialogWidget> createState() =>
      _ProfileCommonDialogWidgetState();
}

class _ProfileCommonDialogWidgetState extends State<ProfileCommonDialogWidget> {
  @override
  void initState() {
    if (MediaQuery.of(widget.context).orientation == Orientation.landscape) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 28.0.h),
        child: widget.child,
      ),
    );
  }
}
