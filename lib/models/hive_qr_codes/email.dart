import 'package:hive_flutter/hive_flutter.dart';
import 'package:qr_code/models/models.dart';

part 'email.g.dart';

@HiveType(typeId: 1)
class EmailHiveModel {

  @HiveField(0)
  final EmailModel emailModel;
  
  @HiveField(1)
  final String data;

  const EmailHiveModel(this.emailModel, this.data);
}
