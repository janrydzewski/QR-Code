// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmailModelAdapter extends TypeAdapter<EmailModel> {
  @override
  final int typeId = 7;

  @override
  EmailModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EmailModel(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, EmailModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.subject)
      ..writeByte(2)
      ..write(obj.message);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmailModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
