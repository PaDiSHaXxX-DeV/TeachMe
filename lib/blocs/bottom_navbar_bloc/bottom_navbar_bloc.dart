import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachme/blocs/bottom_navbar_bloc/bottom_navbar_state.dart';

import 'bottom_navbar_event.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(const BottomNavTab(0));

  Stream<BottomNavState> mapEventToState(BottomNavEvent event) async* {
    if (event is BottomNavTabChanged) {
      yield BottomNavTab(event.tabIndex);
    }
  }
}
