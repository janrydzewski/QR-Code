import 'package:hive_flutter/hive_flutter.dart';

part 'vcard.g.dart';

@HiveType(typeId: 11)
class VCardModel {

  @HiveField(0)
  final String firstName;

  @HiveField(1)
  final String lastName;

  @HiveField(2)
  final String nickname;

  @HiveField(3)
  final String url;

  @HiveField(4)
  final String street;

  @HiveField(5)
  final String city;

  @HiveField(6)
  final String country;

  @HiveField(7)
  final String birthDay;

  @HiveField(8)
  final String note;

  const VCardModel(
      this.firstName,
      this.lastName,
      this.nickname,
      this.url,
      this.street,
      this.city,
      this.country,
      this.birthDay,
      this.note);
}
