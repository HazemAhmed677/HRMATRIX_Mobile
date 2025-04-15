// Format DateTime to "EEEE dd/MM/yyyy" (like "Tuesday 09/07/2024")
import 'package:flutter/material.dart';

import '../table_calendar_for_dialog.dart';

Future<dynamic> showTableCalendarDialog(BuildContext context) async {
  return await showDialog<DateTime>(
    context: context,
    builder: (_) => TableCalendarForDialog(target: context),
  );
}
