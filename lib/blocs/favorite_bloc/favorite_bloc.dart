import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:teachme/data/models/study_model.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<AddFavoriteEvent>((event, emit) {});
    on<DeleteFavoriteEvent>((event, emit) {});
  }
}
