part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteSucces extends FavoriteState {
  final List<StudyModel> data;
  FavoriteSucces({required this.data});
}

class FavoriteLoading extends FavoriteState {}

class FavoriteFailure extends FavoriteState {
  final String? error;
  FavoriteFailure({required this.error});
}
