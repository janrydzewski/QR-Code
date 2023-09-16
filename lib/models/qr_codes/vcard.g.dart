// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vcard.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VCardModelAdapter extends TypeAdapter<VCardModel> {
  @override
  final int typeId = 11;

  @override
  VCardModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VCardModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      fields[7] as String,
      fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, VCardModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.nickname)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.street)
      ..writeByte(5)
      ..write(obj.city)
      ..writeByte(6)
      ..write(obj.country)
      ..writeByte(7)
      ..write(obj.birthDay)
      ..writeByte(8)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VCardModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
