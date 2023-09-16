import 'package:hive_flutter/hive_flutter.dart';

part 'url.g.dart';

@HiveType(typeId: 10)
class UrlModel {

  @HiveField(0)
  final String url;

  const UrlModel(this.url);
}