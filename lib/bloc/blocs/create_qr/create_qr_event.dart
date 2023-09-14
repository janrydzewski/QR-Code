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

class GenerateEventEvent extends CreateQrEvent {
  final String title;
  final String startDate;
  final String endDate;

  const GenerateEventEvent(this.title, this.startDate, this.endDate);

  @override
  List<Object> get props => [title, startDate, endDate];
}

class GenerateSmsEvent extends CreateQrEvent {
  final String phoneNumber;
  final String message;

  const GenerateSmsEvent(this.phoneNumber, this.message);

  @override
  List<Object> get props => [phoneNumber, message];
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
  final String country;
  final String birthDay;
  final String note;

  const GenerateVCardEvent(this.firstName, this.lastName, this.nickname,
      this.url, this.street, this.city, this.country, this.birthDay, this.note);

  @override
  List<Object> get props => [
        firstName,
        lastName,
        nickname,
        url,
        street,
        city,
        country,
        birthDay,
        note
      ];
}

class GenerateWifiEvent extends CreateQrEvent {
  final String networkName;
  final String password;
  final String security;

  const GenerateWifiEvent(this.networkName, this.password, this.security);

  @override
  List<Object> get props => [networkName, password, security];
}
