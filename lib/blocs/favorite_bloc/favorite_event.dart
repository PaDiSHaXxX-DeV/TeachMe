part of 'favorite_bloc.dart';

@immutable

abstract class FavoriteEvent extends Equatable {}

class AddFavoriteEvent extends FavoriteEvent {
  final StudyModel study;

  AddFavoriteEvent({required this.study});

  @override
  List<Object?> get props => [study];
}

class GetAllFavoritesEvent extends FavoriteEvent {
  @override
  List<Object?> get props => [];
}

class UpdatedFavoriteEvent extends FavoriteEvent {
  final StudyModel updatedStudy;

  UpdatedFavoriteEvent({required this.updatedStudy});

  @override
  List<Object?> get props => [updatedStudy];
}

class DeleteFavoriteEvent extends FavoriteEvent {
  final StudyModel favoriteModel;

  DeleteFavoriteEvent({required this.favoriteModel});

  @override
  List<Object?> get props => [favoriteModel];
}