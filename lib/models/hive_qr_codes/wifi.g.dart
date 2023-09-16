// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wifi.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WifiHiveModelAdapter extends TypeAdapter<WifiHiveModel> {
  @override
  final int typeId = 6;

  @override
  WifiHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WifiHiveModel(
      fields[0] as WifiModel,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WifiHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.wifiModel)
      ..writeByte(1)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WifiHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
