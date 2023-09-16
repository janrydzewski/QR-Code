// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventHiveModelAdapter extends TypeAdapter<EventHiveModel> {
  @override
  final int typeId = 2;

  @override
  EventHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventHiveModel(
      fields[0] as EventModel,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, EventHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.eventModel)
      ..writeByte(1)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
