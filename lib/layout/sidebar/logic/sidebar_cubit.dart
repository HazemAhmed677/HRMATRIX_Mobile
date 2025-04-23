import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/helpers/get_sidebar_items.dart';
import 'sidebar_state.dart';

class SidebarCubit extends Cubit<SidebarState> {
  SidebarCubit() : super(const SidebarState());

  void toggleDrawer() =>
      emit(state.copyWith(isDrawerOpen: !state.isDrawerOpen));

  void closeDrawer() => emit(state.copyWith(isDrawerOpen: false));

  void selectIndex(int index) =>
      emit(state.copyWith(selectedIndex: index, selectedSubIndex: null));

  void selectSubIndex(int parentIndex, int subIndex) => emit(
    state.copyWith(selectedIndex: parentIndex, selectedSubIndex: subIndex),
  );

  void clearSubSelection(int parentIndex) {
    emit(state.copyWith(selectedParentIndex: -1, selectedSubIndex: -1));
  }

  void selectSubItem(int parentIndex, int subIndex) {
    final parentTitle = getSidebarItems()[parentIndex].title;
    emit(
      state.copyWith(
        selectedParentIndex: parentIndex,
        selectedSubIndex: subIndex,
        selectedParentTitle: parentTitle,
      ),
    );
  }

  void toggleExpand(String title) {
    final expanded = Set<String>.from(state.expandedTitles);
    final isExpanded = expanded.contains(title);

    if (isExpanded) {
      expanded.remove(title);
      if (title == state.selectedParentTitle) {
        emit(
          state.copyWith(
            expandedTitles: expanded,
            selectedSubIndex: null,
            selectedParentTitle: null,
          ),
        );
        return;
      }
    } else {
      expanded.add(title);
    }

    emit(state.copyWith(expandedTitles: expanded));
  }

  void updateAppBarVisibility(bool isVisible) {
    if (state.isAppBarVisible != isVisible) {
      emit(state.copyWith(isAppBarVisible: isVisible));
    }
  }
}
