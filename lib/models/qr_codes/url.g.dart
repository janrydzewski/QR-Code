// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'url.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UrlModelAdapter extends TypeAdapter<UrlModel> {
  @override
  final int typeId = 10;

  @override
  UrlModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UrlModel(
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UrlModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UrlModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
