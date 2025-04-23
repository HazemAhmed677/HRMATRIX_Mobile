import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/assets_table.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/common_container_profile.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/loading_widget.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/no_data_available.dart';
import 'package:hrmatrix/features/profile_pt1/ui/widgets/profile_common_row.dart';
import 'package:hrmatrix/features/requests/ui/widgets/assets_request_dialog.dart';
import 'package:hrmatrix/features/requests/ui/widgets/helpers/profile_common_dialog.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/custom_search_text_field.dart';
import '../../logic/get_my_assets/get_my_assets_cubit.dart';

class AssetsTableContainer extends StatefulWidget {
  const AssetsTableContainer({super.key});

  @override
  State<AssetsTableContainer> createState() => _AssetsTableContainerState();
}

class _AssetsTableContainerState extends State<AssetsTableContainer> {
  @override
  void initState() {
    BlocProvider.of<GetMyAssetsCubit>(context).getMyAssets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CommonContainerProfile(
      child: Column(
        children: [
          CustomSearchTextFeild(readOnly: false, hintText: 'Search...'),
          verticalSpace(28),
          if (MediaQuery.orientationOf(context) == Orientation.landscape)
            ProfileCommonRow(
              text: 'Request Asset',
              onPressed: () {
                showProfileCommonDialog(
                  child: AssetsRequestDialog(),
                  context: context,
                );
              },
            ),
          verticalSpace(28),
          BlocBuilder<GetMyAssetsCubit, GetMyAssetsState>(
            builder: (context, state) {
              if (state is GetMyAssetsLoading) {
                return LoadingWidget();
              } else if (state is GetMyAssetsSuccess) {
                if (state.getMyAssetsList.isEmpty) {
                  return NoDataAvailable();
                }
                return AssetsTable(assets: state.getMyAssetsList);
              } else if (state is GetMyAssetsFailure) {
                return Text(state.errorMsg);
              } else {
                return SizedBox.shrink();
              }
            },
          ),
          // Table Widget
        ],
      ),
    );
  }
}
