part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent {}

class AddFavoriteEvent extends FavoriteEvent {
  final StudyModel data;
  AddFavoriteEvent({required this.data});
}

class DeleteFavoriteEvent extends FavoriteEvent {
  final String id;
  DeleteFavoriteEvent({required this.id});
}class GetAllFavoriteEvent extends FavoriteEvent {

}
