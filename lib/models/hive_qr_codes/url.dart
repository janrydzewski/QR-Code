import 'package:hive_flutter/hive_flutter.dart';
import 'package:qr_code/models/models.dart';

part 'url.g.dart';

@HiveType(typeId: 4)
class UrlHiveModel {

  @HiveField(0)
  final UrlModel urlModel;

  @HiveField(1)
  final String data;

  const UrlHiveModel(this.urlModel, this.data);
}