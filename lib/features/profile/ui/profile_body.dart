import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrmatrix/core/helper/spacing.dart';
import 'package:hrmatrix/features/profile/logic/cubit/bar_ui_cubit.dart';
import 'package:hrmatrix/features/profile/ui/widgets/bar_list_view.dart';
import 'package:hrmatrix/features/profile/ui/widgets/profile_ui.dart';

import 'widgets/swipe_to_explore.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SwipeToExplore(),
          verticalSpace(12),
          BarListView(),
          verticalSpace(18),
          BlocBuilder<BarUiCubit, BarUiState>(
            builder: (context, state) {
              return ProfileUI();
            },
          ),
        ],
      ),
    );
  }
}
