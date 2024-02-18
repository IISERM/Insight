// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insight_user_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InsightUserAdapter extends TypeAdapter<InsightUser> {
  @override
  final int typeId = 0;

  @override
  InsightUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InsightUser()
      ..accessToken = fields[0] as String?
      ..token = fields[1] as String?
      ..idToken = fields[2] as String?
      ..secret = fields[3] as String?
      ..refreshToken = fields[4] as String?;
  }

  @override
  void write(BinaryWriter writer, InsightUser obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.accessToken)
      ..writeByte(1)
      ..write(obj.token)
      ..writeByte(2)
      ..write(obj.idToken)
      ..writeByte(3)
      ..write(obj.secret)
      ..writeByte(4)
      ..write(obj.refreshToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InsightUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
