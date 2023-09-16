import 'package:hive_flutter/hive_flutter.dart';
import 'package:qr_code/models/models.dart';

class ListRepository{
  const ListRepository();

  List<EmailHiveModel> getEmailQrList() {
    final emailQrList = Hive.box("email");
    return emailQrList.values.cast<EmailHiveModel>().toList();

  }

  List<EventHiveModel> getEventQrList() {
    final eventQrList = Hive.box("event");
    return eventQrList.values.cast<EventHiveModel>().toList();
  }

  List<SmsHiveModel> getSmsQrList() {
    final smsQrList = Hive.box("sms");
    return smsQrList.values.cast<SmsHiveModel>().toList();
  }

  List<UrlHiveModel> getUrlQrList() {
    final urlQrList = Hive.box("url");
    return urlQrList.values.cast<UrlHiveModel>().toList();
  }

  List<VCardHiveModel> getVCardQrList() {
    final vCardQrList = Hive.box("vcard");
    return vCardQrList.values.cast<VCardHiveModel>().toList();
  }

  List<WifiHiveModel> getWifiQrList() {
    final wifiQrList = Hive.box("wifi");
    return wifiQrList.values.cast<WifiHiveModel>().toList();
  }
}