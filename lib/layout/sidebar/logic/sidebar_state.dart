import 'package:equatable/equatable.dart';

class SidebarState extends Equatable {
  final int selectedIndex;
  final int? selectedSubIndex;
  final bool isDrawerOpen;
  final bool isAppBarVisible;
  final Set<String> expandedTitles;
  final int? selectedParentIndex;
  final String? selectedParentTitle;

  const SidebarState({
    this.selectedIndex = 0,
    this.selectedSubIndex,
    this.isDrawerOpen = false,
    this.isAppBarVisible = true,
    this.expandedTitles = const {},
    this.selectedParentIndex,
    this.selectedParentTitle,
  });

  SidebarState copyWith({
    int? selectedIndex,
    int? selectedSubIndex,
    bool? isDrawerOpen,
    bool? isAppBarVisible,
    Set<String>? expandedTitles,
    int? selectedParentIndex,
    String? selectedParentTitle,
  }) {
    return SidebarState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      selectedSubIndex: selectedSubIndex ?? this.selectedSubIndex,
      isDrawerOpen: isDrawerOpen ?? this.isDrawerOpen,
      isAppBarVisible: isAppBarVisible ?? this.isAppBarVisible,
      expandedTitles: expandedTitles ?? this.expandedTitles,
      selectedParentIndex: selectedParentIndex ?? this.selectedParentIndex,
    );
  }

  @override
  List<Object?> get props => [
    selectedIndex,
    selectedSubIndex,
    isDrawerOpen,
    isAppBarVisible,
    expandedTitles,
  ];
}
