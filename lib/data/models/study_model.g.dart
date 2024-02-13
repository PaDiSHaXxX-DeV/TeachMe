part of 'study_model.dart';



class StudyModelAdapter extends TypeAdapter<StudyModel> {
  @override
  final int typeId = 0;

  @override
  StudyModel read(BinaryReader reader) {
    return StudyModel(
      image: reader.read(),
      fullName: reader.read(),
      description: reader.read(),
      location: reader.read(),
      major: reader.read(),
      rating: reader.read(),
      number: reader.read(),
      isFavorite: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, StudyModel obj) {
    writer.write(obj.image);
    writer.write(obj.fullName);
    writer.write(obj.description);
    writer.write(obj.location);
    writer.write(obj.major);
    writer.write(obj.rating);
    writer.write(obj.number);
    writer.write(obj.isFavorite);
  }
}
