// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sms.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SmsHiveModelAdapter extends TypeAdapter<SmsHiveModel> {
  @override
  final int typeId = 3;

  @override
  SmsHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SmsHiveModel(
      fields[0] as SmsModel,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SmsHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.smsModel)
      ..writeByte(1)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SmsHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
