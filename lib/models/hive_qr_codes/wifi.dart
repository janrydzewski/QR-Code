import 'package:hive_flutter/hive_flutter.dart';
import 'package:qr_code/models/models.dart';

part 'wifi.g.dart';

@HiveType(typeId: 6)
class WifiHiveModel {

  @HiveField(0)
  final WifiModel wifiModel;

  @HiveField(1)
  final String data;

  const WifiHiveModel(this.wifiModel, this.data);

}