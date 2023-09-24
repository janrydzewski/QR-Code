import 'package:hive_flutter/hive_flutter.dart';

part 'vcard.g.dart';

@HiveType(typeId: 11)
class VCardModel {
  @HiveField(0)
  final String firstName;

  @HiveField(1)
  final String lastName;

  @HiveField(2)
  final String number;

  @HiveField(3)
  final String nickname;

  @HiveField(4)
  final String url;

  @HiveField(5)
  final String street;

  @HiveField(6)
  final String city;

  @HiveField(7)
  final String country;

  @HiveField(8)
  final String birthDay;

  @HiveField(9)
  final String note;

  const VCardModel(
    this.firstName,
    this.lastName,
    this.number,
    this.nickname,
    this.url,
    this.street,
    this.city,
    this.country,
    this.birthDay,
    this.note,
  );
}
