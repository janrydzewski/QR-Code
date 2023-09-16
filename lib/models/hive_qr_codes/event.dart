import 'package:hive_flutter/hive_flutter.dart';
import 'package:qr_code/models/models.dart';

part 'event.g.dart';

@HiveType(typeId: 2)
class EventHiveModel {

  @HiveField(0)
  final EventModel eventModel;

  @HiveField(1)
  final String data;

  const EventHiveModel(this.eventModel, this.data);
}
