part of 'create_qr_bloc.dart';

class CreateQrEvent extends Equatable {
  const CreateQrEvent();

  @override
  List<Object> get props => [];
}

class GenerateEmailEvent extends CreateQrEvent {
  final EmailModel emailModel;

  const GenerateEmailEvent(this.emailModel);

  @override
  List<Object> get props => [emailModel];
}

class GenerateEventEvent extends CreateQrEvent {
  final EventModel eventModel;

  const GenerateEventEvent(this.eventModel);

  @override
  List<Object> get props => [eventModel];
}

class GenerateSmsEvent extends CreateQrEvent {
  final SmsModel smsModel;

  const GenerateSmsEvent(this.smsModel);

  @override
  List<Object> get props => [smsModel];
}

class GenerateUrlEvent extends CreateQrEvent {
  final UrlModel urlModel;

  const GenerateUrlEvent(this.urlModel);

  @override
  List<Object> get props => [urlModel];
}

class GenerateVCardEvent extends CreateQrEvent {
  final VCardModel vCardModel;

  const GenerateVCardEvent(this.vCardModel);

  @override
  List<Object> get props => [
        vCardModel
      ];
}

class GenerateWifiEvent extends CreateQrEvent {
  final WifiModel wifiModel;

  const GenerateWifiEvent(this.wifiModel);

  @override
  List<Object> get props => [wifiModel];
}

class ShowEmailEvent extends CreateQrEvent {
  final EmailModel emailModel;

  const ShowEmailEvent(this.emailModel);

  @override
  List<Object> get props => [emailModel];
}

class ShowEventEvent extends CreateQrEvent {
  final EventModel eventModel;

  const ShowEventEvent(this.eventModel);

  @override
  List<Object> get props => [eventModel];
}

class ShowSmsEvent extends CreateQrEvent {
  final SmsModel smsModel;

  const ShowSmsEvent(this.smsModel);

  @override
  List<Object> get props => [smsModel];
}

class ShowUrlEvent extends CreateQrEvent {
  final UrlModel urlModel;

  const ShowUrlEvent(this.urlModel);

  @override
  List<Object> get props => [urlModel];
}

class ShowVCardEvent extends CreateQrEvent {
  final VCardModel vCardModel;

  const ShowVCardEvent(this.vCardModel);

  @override
  List<Object> get props => [
        vCardModel
      ];
}

class ShowWifiEvent extends CreateQrEvent {
  final WifiModel wifiModel;

  const ShowWifiEvent(this.wifiModel);

  @override
  List<Object> get props => [wifiModel];
}
