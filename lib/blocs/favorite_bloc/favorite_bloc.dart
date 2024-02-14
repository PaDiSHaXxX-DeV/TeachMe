import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:teachme/data/models/form_status.dart';
import 'package:teachme/data/models/study_model.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc()
      : super(
          const FavoriteState(
            status: FormStatus.pure,
            statusText: "",
            studys: [],
          ),
        ) {
    on<AddFavoriteEvent>(_addFavorite);
    on<GetAllFavoritesEvent>(_getFavorites);
    on<DeleteFavoriteEvent>(_deleteFavorite);
  }

  void _addFavorite(AddFavoriteEvent event, Emitter<FavoriteState> emit) async {
    try {
      emit(state.copyWith(
          status: FormStatus.loading, statusText: "Adding User..."));

      final box = await Hive.openBox<StudyModel>('studyBox');

      if (!box.isOpen) {
        emit(state.copyWith(
            status: FormStatus.error, statusText: "Failed to open box."));
        return;
      }

      await box.add(event.study);

      emit(state.copyWith(
          status: FormStatus.success, statusText: "Data added successfully!"));

      add(GetAllFavoritesEvent());
    } catch (error) {
      emit(state.copyWith(
          status: FormStatus.error, statusText: "Error: $error"));
    }
  }

  _getFavorites(GetAllFavoritesEvent event, Emitter<FavoriteState> emit) async {
    emit(
      state.copyWith(
        status: FormStatus.loading,
        statusText: "Getting Favorites...",
      ),
    );
    final box = await Hive.openBox<StudyModel>('studyBox');
    List<StudyModel> studyModels = [];
    for (var i = 0; i < box.length; i++) {
      studyModels.add(box.getAt(i)!);
    }
    emit(
      state.copyWith(
        status: FormStatus.success,
        statusText: "Favorites fetched !!!",
        studys: studyModels,
      ),
    );
  }

  _deleteFavorite(
      DeleteFavoriteEvent event, Emitter<FavoriteState> emit) async {
    emit(
      state.copyWith(
        status: FormStatus.loading,
        statusText: "Deleting Favorite...",
      ),
    );
    final box = await Hive.openBox<StudyModel>('studyBox');
    final index = box.values
        .toList()
        .indexWhere((element) => element == event.favoriteModel);
    if (index != -1) {
      await box.deleteAt(index);
    }
    await box.close();

    emit(
      state.copyWith(
        status: FormStatus.success,
        statusText: "Users deleted !!!",
      ),
    );
    add(GetAllFavoritesEvent());
  }
}
