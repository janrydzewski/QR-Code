part of 'create_qr_bloc.dart';

class CreateQrEvent extends Equatable {
  const CreateQrEvent();

  @override
  List<Object> get props => [];
}

class GenerateEmailEvent extends CreateQrEvent {
  final String email;
  final String subject;
  final String message;

  const GenerateEmailEvent(this.email, this.subject, this.message);

  @override
  List<Object> get props => [email, subject, message];
}

class GenerateFacebookEvent extends CreateQrEvent {
  
  final String link;

  const GenerateFacebookEvent(this.link);

  @override
  List<Object> get props => [link];
}


class GenerateSmsEvent extends CreateQrEvent {
  final String number;
  final String message;

  const GenerateSmsEvent(this.number, this.message);

  @override
  List<Object> get props => [number, message];
}


class GenerateUrlEvent extends CreateQrEvent {
  final String url;

  const GenerateUrlEvent(this.url);

  @override
  List<Object> get props => [url];
}


class GenerateVCardEvent extends CreateQrEvent {
  final String firstName;
  final String lastName;
  final String nickname;
  final String url;
  final String street;
  final String city;
  final String zipCode;
  final String country;
  final String birthDay;
  final String note;

  const GenerateVCardEvent(
      this.firstName,
      this.lastName,
      this.nickname,
      this.url,
      this.street,
      this.city,
      this.zipCode,
      this.country,
      this.birthDay,
      this.note);

  @override
  List<Object> get props => [firstName, lastName, nickname, url, street, city, zipCode, country, birthDay, note];
}


class GenerateWifiEvent extends CreateQrEvent {
  final String networkName;
  final String password;
  final String company;

  const GenerateWifiEvent(this.networkName, this.password, this.company);

  @override
  List<Object> get props => [networkName, password, company];
}

