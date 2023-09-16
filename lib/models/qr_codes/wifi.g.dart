// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wifi.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WifiModelAdapter extends TypeAdapter<WifiModel> {
  @override
  final int typeId = 12;

  @override
  WifiModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WifiModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WifiModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.networkName)
      ..writeByte(1)
      ..write(obj.password)
      ..writeByte(2)
      ..write(obj.security);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WifiModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
