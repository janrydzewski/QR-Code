// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UrlHiveModelAdapter extends TypeAdapter<UrlHiveModel> {
  @override
  final int typeId = 4;

  @override
  UrlHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UrlHiveModel(
      fields[0] as UrlModel,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UrlHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.urlModel)
      ..writeByte(1)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UrlHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
