import 'package:hive_flutter/hive_flutter.dart';

part 'wifi.g.dart';

@HiveType(typeId: 12)
class WifiModel {

  @HiveField(0)
  final String networkName;

  @HiveField(1)
  final String password;

  @HiveField(2)
  final String security;

  const WifiModel(this.networkName, this.password, this.security);

}