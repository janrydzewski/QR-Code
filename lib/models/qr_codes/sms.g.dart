// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sms.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SmsModelAdapter extends TypeAdapter<SmsModel> {
  @override
  final int typeId = 9;

  @override
  SmsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SmsModel(
      fields[0] as String,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SmsModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.message);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SmsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
