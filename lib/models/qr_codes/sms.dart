import 'package:hive/hive.dart';

part 'sms.g.dart';

@HiveType(typeId: 9)
class SmsModel {

  @HiveField(0)
  final String number;
  @HiveField(1)
  final String message;

  const SmsModel(this.number, this.message);
}