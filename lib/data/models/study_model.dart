class StudyModel {
  final String image;
  final String fullName;
  final String description;
  final String location;
  final String major;
  final String rating;
  final String number;

  StudyModel(
      {required this.image,
      required this.fullName,
      required this.description,
      required this.location,
      required this.major,
      required this.rating,
      required this.number});

  StudyModel copyWith({

    String? fullName,
    String? description,
    String? image,
    String? price,
    String? rating,
    String? type,
    String? number,
  }) =>
      StudyModel(
        image: image ?? this.image,
        fullName: fullName ?? this.fullName,
        description: description ?? this.description,
        location: type ?? this.location,
        major: price ?? this.major,
        rating: rating ?? this.rating,
        number: number ?? this.number,
      );

  factory StudyModel.fromJson(Map<String, dynamic> json) => StudyModel(
        image: json['image'] as String? ?? '',
        fullName: json['fullName'] as String? ?? '',
    description: json['description'] as String? ?? '',
        location: json['location'] as String? ?? '',
        major: json['major'] as String? ?? '',
        rating: json['rating'] as String? ?? '',
        number: json['number'] as String? ?? '',
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
      };
}
