import 'package:flutter_bloc/flutter_bloc.dart';

import 'sidebar_state.dart';

class SidebarCubit extends Cubit<SidebarState> {
  SidebarCubit() : super(SidebarState(isDrawerOpen: false, selectedIndex: 0));

  void toggleDrawer() =>
      emit(state.copyWith(isDrawerOpen: !state.isDrawerOpen));

  void closeDrawer() => emit(state.copyWith(isDrawerOpen: false));

  void selectIndex(int index) {
    emit(state.copyWith(selectedIndex: index));
    // DON'T close the drawer here
  }
}
