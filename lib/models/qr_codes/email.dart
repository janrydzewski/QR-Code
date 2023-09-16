import 'package:hive_flutter/hive_flutter.dart';

part 'email.g.dart';

@HiveType(typeId: 7)
class EmailModel {
  
  @HiveField(0)
  final String email;

  @HiveField(1)
  final String subject;

  @HiveField(2)
  final String message;

  const EmailModel(this.email, this.subject, this.message);
}
