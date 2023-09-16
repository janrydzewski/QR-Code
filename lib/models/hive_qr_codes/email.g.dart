// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EmailHiveModelAdapter extends TypeAdapter<EmailHiveModel> {
  @override
  final int typeId = 1;

  @override
  EmailHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EmailHiveModel(
      fields[0] as EmailModel,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, EmailHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.emailModel)
      ..writeByte(1)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmailHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
