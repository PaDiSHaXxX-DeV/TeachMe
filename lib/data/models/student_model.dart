class StudentModel {
  final String image;
  final String fullName;
  final String email;
  final String major;
  final String number;

  StudentModel({
    required this.image,
    required this.fullName,
    required this.email,
    required this.major,
    required this.number,
  });

  StudentModel copyWith({
    String? fullName,
    String? email,
    String? image,
    String? major,
    String? number,
  }) =>
      StudentModel(
        image: image ?? this.image,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        major: major ?? this.major,
        number: number ?? this.number,
      );

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        image: json['image'] as String? ?? '',
        fullName: json['fullName'] as String? ?? '',
        email: json['email'] as String? ?? '',
        major: json['major'] as String? ?? '',
        number: json['number'] as String? ?? '',
      );

  @override
  String toString() => '''
    image: $image,
    fullName: $fullName,
    email: $email,
    major: $major,
    number: $number,
  ''';

  Map<String, dynamic> toJson() => {
        'image': image,
        'full_name': fullName,
        'email': email,
        'major': major,
        'number': number,
      };
}
