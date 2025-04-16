import 'package:flutter/material.dart';

Future<Future<Object?>> logoutDialogHelper({
  required BuildContext context,
  required Widget child,
}) async {
  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Dismiss",
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (_, __, ___) {
      return SafeArea(
        child: Builder(
          builder:
              (context) => Center(
                child: Material(
                  type: MaterialType.transparency, // Important!
                  child: child,
                ),
              ),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      return FadeTransition(opacity: anim, child: child);
    },
  );
}
