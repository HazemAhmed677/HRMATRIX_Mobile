import 'package:equatable/equatable.dart';

class SidebarState extends Equatable {
  final int selectedIndex;
  final bool isDrawerOpen;

  const SidebarState({this.selectedIndex = 0, this.isDrawerOpen = false});

  SidebarState copyWith({int? selectedIndex, bool? isDrawerOpen}) {
    return SidebarState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isDrawerOpen: isDrawerOpen ?? this.isDrawerOpen,
    );
  }

  @override
  List<Object> get props => [selectedIndex, isDrawerOpen];
}
