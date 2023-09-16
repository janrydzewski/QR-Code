import 'package:hive_flutter/hive_flutter.dart';
import 'package:qr_code/models/models.dart';

part 'sms.g.dart';

@HiveType(typeId: 3)
class SmsHiveModel {

  @HiveField(0)
  final SmsModel smsModel;

  @HiveField(1)
  final String data;

  const SmsHiveModel(this.smsModel, this.data);
}