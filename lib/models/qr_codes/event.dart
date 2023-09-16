import 'package:hive_flutter/hive_flutter.dart';

part 'event.g.dart';

@HiveType(typeId: 8)
class EventModel {

  @HiveField(0)
  final String title;

  @HiveField(1)
  final String startDate;

  @HiveField(2)
  final String endDate;

  const EventModel(this.title, this.startDate, this.endDate);
}