// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentAdapter extends TypeAdapter<Student> {
  @override
  final int typeId = 1;

  @override
  Student read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Student()
      ..registrationNumber = fields[0] as String?
      ..name = fields[1] as String?
      ..photoURL = fields[2] as String?
      ..isSubscribedToSRM = fields[3] as bool?
      ..settings = fields[4] as Settings?
      ..insightUser = fields[5] as InsightUser?;
  }

  @override
  void write(BinaryWriter writer, Student obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.registrationNumber)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.photoURL)
      ..writeByte(3)
      ..write(obj.isSubscribedToSRM)
      ..writeByte(4)
      ..write(obj.settings)
      ..writeByte(5)
      ..write(obj.insightUser);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
