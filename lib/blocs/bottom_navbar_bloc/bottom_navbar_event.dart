import 'package:equatable/equatable.dart';

abstract class BottomNavEvent extends Equatable {
  const BottomNavEvent();

  @override
  List<Object> get props => [];
}

class BottomNavTabChanged extends BottomNavEvent {
  final int tabIndex;

  const BottomNavTabChanged(this.tabIndex);

  @override
  List<Object> get props => [tabIndex];
}
