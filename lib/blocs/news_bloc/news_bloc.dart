import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:teachme/data/models/form_status.dart';
import 'package:teachme/data/models/unversal_data.dart';
import 'package:teachme/data/news_model.dart';
import 'package:teachme/data/repository/news_repo.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({required this.repository})
      : super(NewsState(status: FormStatus.pure, news: [], statusText: '')) {
    on<NewsEvent>((event, emit) {});
    on<GetAllArticlesEvent>(_getAllNews);
    add(GetAllArticlesEvent());
  }
  final NewsRepository repository;
  _getAllNews(NewsEvent event, Emitter<NewsState> emit) async {
    emit(state.copyWith(status: FormStatus.loading, statusText: 'Loading...'));
    UniversalData response = await repository.getAllArticles();
    if (response.error.isEmpty) {
      NewsModel model=response.data;
      emit(
        state.copyWith(
          status: FormStatus.success,
          statusText: "SUCCESS",
          news: model.articles,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: FormStatus.error,
          statusText: response.error,
        ),
      );
    }
  }
}
