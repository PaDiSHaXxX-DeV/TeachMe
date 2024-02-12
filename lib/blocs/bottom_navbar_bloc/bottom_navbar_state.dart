import 'package:equatable/equatable.dart';

abstract class BottomNavState extends Equatable {
  const BottomNavState();

  @override
  List<Object> get props => [];
}

class BottomNavTab extends BottomNavState {
  final int tabIndex;

  const BottomNavTab(this.tabIndex);

  @override
  List<Object> get props => [tabIndex];
}
