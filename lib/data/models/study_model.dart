import 'package:hive_flutter/hive_flutter.dart';

part 'study_model.g.dart';

class StudyModel {
  final String image;
  final String fullName;
  final String description;
  final String location;
  final String major;
  final String rating;
  final String number;
  bool isFavorite = false;

  StudyModel({
    required this.image,
    required this.fullName,
    required this.isFavorite,
    required this.description,
    required this.location,
    required this.major,
    required this.rating,
    required this.number,
  });

  StudyModel copyWith({
    String? fullName,
    String? description,
    String? image,
    String? major,
    String? rating,
    String? location,
    String? number,
    bool? isFavorite,
  }) =>
      StudyModel(
        image: image ?? this.image,
        fullName: fullName ?? this.fullName,
        description: description ?? this.description,
        location: location ?? this.location,
        major: major ?? this.major,
        rating: rating ?? this.rating,
        number: number ?? this.number,
        isFavorite: isFavorite ?? this.isFavorite,
      );

  factory StudyModel.fromJson(Map<String, dynamic> json) => StudyModel(
        image: json['image'] as String? ?? '',
        fullName: json['fullName'] as String? ?? '',
        description: json['description'] as String? ?? '',
        location: json['location'] as String? ?? '',
        major: json['major'] as String? ?? '',
        rating: json['rating'] as String? ?? '',
        number: json['number'] as String? ?? '',
        isFavorite: json['isFavorite'] as bool? ?? false,
      );

  @override
  String toString() => '''
    image: $image,
    fullName: $fullName,
    description: $description,
    location: $location,
    major: $major,
    rating: $rating,
    number: $number,
  ''';

  Map<String, dynamic> toJson() => {
        'image': image,
        'full_name': fullName,
        'description': description,
        'location': location,
        'major': major,
        'rating': rating,
        'number': number,
        'isFavorite': isFavorite,
      };
}
