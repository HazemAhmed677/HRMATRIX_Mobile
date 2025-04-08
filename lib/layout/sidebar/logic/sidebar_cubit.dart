import 'package:flutter_bloc/flutter_bloc.dart';

import 'sidebar_state.dart';

class SidebarCubit extends Cubit<SidebarState> {
  SidebarCubit() : super(const SidebarState());

  void selectIndex(int index) {
    emit(state.copyWith(selectedIndex: index, isDrawerOpen: false));
  }

  void toggleDrawer() {
    emit(state.copyWith(isDrawerOpen: !state.isDrawerOpen));
  }

  void closeDrawer() {
    emit(state.copyWith(isDrawerOpen: false));
  }
}
