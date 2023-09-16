import 'package:hive_flutter/hive_flutter.dart';
import 'package:qr_code/models/models.dart';

part 'vcard.g.dart';

@HiveType(typeId: 5)
class VCardHiveModel {

  @HiveField(0)
  final VCardModel vCardModel;

  @HiveField(1)
  final String data;

  const VCardHiveModel(
      this.vCardModel, this.data);
}
