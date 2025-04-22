import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showSuccessSnackBar({
  required BuildContext context,
  required String e,
  int delay = 350,
  required Color backgroundColor,
}) {
  showTopSnackBar(
    displayDuration: Duration(milliseconds: delay),
    Overlay.of(context),
    CustomSnackBar.success(message: e, backgroundColor: backgroundColor),
  );
}

void showErrorSnackBar({
  required BuildContext context,
  required String e,
  required Color backgroundColor,
  int delay = 350,
}) {
  showTopSnackBar(
    displayDuration: Duration(milliseconds: delay),
    Overlay.of(context),
    CustomSnackBar.error(message: e, backgroundColor: backgroundColor),
  );
}

void showInfoSnackBar({
  required BuildContext context,
  required String e,
  required Color backgroundColor,
  int delay = 350,
}) {
  showTopSnackBar(
    displayDuration: Duration(milliseconds: delay),
    Overlay.of(context),
    CustomSnackBar.info(message: e, backgroundColor: backgroundColor),
  );
}
