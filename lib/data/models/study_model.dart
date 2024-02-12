class StudyModel {
  final String image;
  final String fullName;
  final String location;
  final String major;
  final String rating;
  final String number;

  StudyModel(
      {required this.image,
      required this.fullName,
      required this.location,
      required this.major,
      required this.rating,
      required this.number});

  StudyModel copyWith({
    String? fullName,
    String? image,
    String? price,
    String? type,
  }) =>
      StudyModel(
        image: image ?? this.image,
        fullName: fullName ?? this.fullName,
        location: type ?? this.location,
        major: price ?? this.major,
        rating: rating ?? this.rating,
        number: number ?? this.number,
      );

  factory StudyModel.fromJson(Map<String, dynamic> json) => StudyModel(
        image: json['image'] as String? ?? '',
        fullName: json['fullName'] as String? ?? '',
        location: json['location'] as String? ?? '',
        major: json['major'] as String? ?? '',
        rating: json['rating'] as String? ?? '',
        number: json['number'] as String? ?? '',
      );

  @override
  String toString() => '''
    image: $image,
    fullName: $fullName,
    location: $location,
    major: $major,
    rating: $rating,
    number: $number,
  ''';

  Map<String, dynamic> toJson() => {
        'image': image,
        'full_name': fullName,
        'location': location,
        'major': major,
        'rating': rating,
        'number': number,
      };
}
