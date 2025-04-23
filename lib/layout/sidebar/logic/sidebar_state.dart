import 'package:equatable/equatable.dart';

class SidebarState extends Equatable {
  final int selectedIndex;
  final bool isDrawerOpen;
  final bool isAppBarVisible;
  final Set<String> expandedTitles;

  const SidebarState({
    this.selectedIndex = 0,
    this.isDrawerOpen = false,
    this.isAppBarVisible = true,
    this.expandedTitles = const {},
  });

  SidebarState copyWith({
    int? selectedIndex,
    bool? isDrawerOpen,
    bool? isAppBarVisible,
    Set<String>? expandedTitles,
  }) {
    return SidebarState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isDrawerOpen: isDrawerOpen ?? this.isDrawerOpen,
      isAppBarVisible: isAppBarVisible ?? this.isAppBarVisible,
      expandedTitles: expandedTitles ?? this.expandedTitles,
    );
  }

  @override
  List<Object> get props => [
    selectedIndex,
    isDrawerOpen,
    isAppBarVisible,
    expandedTitles,
  ];
}
