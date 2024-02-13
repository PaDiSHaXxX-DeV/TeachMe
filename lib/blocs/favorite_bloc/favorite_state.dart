part of 'favorite_bloc.dart';

@immutable
class FavoriteState extends Equatable {
  const FavoriteState(
      {required this.status, required this.statusText, required this.studys});

  final FormStatus status;
  final List<StudyModel> studys;
  final String statusText;

  FavoriteState copyWith({
    FormStatus? status,
    List<StudyModel>? studys,
    String? statusText,
  }) =>
      FavoriteState(
          status: status ?? this.status,
          statusText: statusText ?? this.statusText,
          studys: studys ?? this.studys);

  @override
  List<Object?> get props => [
        status,
        studys,
        statusText,
      ];
}
