part of 'news_bloc.dart';

 class NewsState extends Equatable {
  final FormStatus status;
  final List<Article> news;
  final String statusText;
  const NewsState(
      {required this.status, required this.news, required this.statusText});

  NewsState copyWith({
    FormStatus? status,
    List<Article>? news,
    String? statusText,
  }) =>
      NewsState(
          status: status ?? this.status,
          statusText: statusText ?? this.statusText,
          news: news ?? this.news);

  @override
  List<Object?> get props => [
    status,
    news,
    statusText,
  ];
}
