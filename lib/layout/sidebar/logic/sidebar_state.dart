import 'package:equatable/equatable.dart';

class SidebarState extends Equatable {
  final int selectedIndex;
  final bool isDrawerOpen;
  final bool isAppBarVisible;

  const SidebarState({
    this.selectedIndex = 0,
    this.isDrawerOpen = false,
    this.isAppBarVisible = true,
  });

  SidebarState copyWith({
    int? selectedIndex,
    bool? isDrawerOpen,
    bool? isAppBarVisible,
  }) {
    return SidebarState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isDrawerOpen: isDrawerOpen ?? this.isDrawerOpen,
      isAppBarVisible: isAppBarVisible ?? this.isAppBarVisible,
    );
  }

  @override
  List<Object> get props => [selectedIndex, isDrawerOpen, isAppBarVisible];
}
