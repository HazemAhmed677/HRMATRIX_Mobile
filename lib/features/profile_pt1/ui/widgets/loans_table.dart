import 'package:flutter/material.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/common_container_profile.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/no_data_available.dart';

class LoansTable extends StatelessWidget {
  const LoansTable({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonContainerProfile(child: NoDataAvailable());
  }
}
