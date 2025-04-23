import 'package:flutter_bloc/flutter_bloc.dart';

import 'sidebar_state.dart';

class SidebarCubit extends Cubit<SidebarState> {
  SidebarCubit() : super(const SidebarState());

  void toggleDrawer() =>
      emit(state.copyWith(isDrawerOpen: !state.isDrawerOpen));

  void closeDrawer() => emit(state.copyWith(isDrawerOpen: false));

  void selectIndex(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  void toggleExpand(String title) {
    final expanded = Set<String>.from(state.expandedTitles);
    if (expanded.contains(title)) {
      expanded.remove(title);
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
