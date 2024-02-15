part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {}

class GetAllArticlesEvent extends NewsEvent {
  @override
  List<Object?> get props => [];
}
