// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vcard.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VCardHiveModelAdapter extends TypeAdapter<VCardHiveModel> {
  @override
  final int typeId = 5;

  @override
  VCardHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VCardHiveModel(
      fields[0] as VCardModel,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, VCardHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.vCardModel)
      ..writeByte(1)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VCardHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
