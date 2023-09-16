import 'package:qr_code/models/models.dart';

class CreateQrRepository{
  const CreateQrRepository();

  String createEmailQrCode(EmailModel emailModel){
    return "mailto:${emailModel.email}?subject=${emailModel.subject}&body=${emailModel.message}";
  }

  String createEventQrCode(EventModel eventModel){
    return "BEGIN:VEVENT\n""SUMMARY:${eventModel.title}\n""DTSTART:${eventModel.startDate}\n""DTEND:${eventModel.endDate}\n""END:VEVENT";
  }

  String createSmsQrCode(SmsModel smsModel){
    return "SMSTO:${smsModel.number}:${smsModel.message}";
  }

  String createUrlQrCode(UrlModel urlModel){
    return "https://${urlModel.url}/";
  }

  String createVCardQrCode(VCardModel vCardModel){
    return "MECARD:N:${vCardModel.lastName},${vCardModel.firstName};NICKNAME:${vCardModel.nickname};URL:${vCardModel.url};ADR:${vCardModel.street},${vCardModel.city},${vCardModel.country};BDAY:${vCardModel.birthDay};NOTE:${vCardModel.note};;";
  }

  String createWifiQrCode(WifiModel wifiModel){
    return "WIFI:S:${wifiModel.networkName};T:${wifiModel.security};P:${wifiModel.password};;";
  }
}