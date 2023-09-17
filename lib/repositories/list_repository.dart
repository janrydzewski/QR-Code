import 'package:hive_flutter/hive_flutter.dart';
import 'package:qr_code/models/models.dart';

class ListRepository {
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

  void deleteModelFromFavourite(String data, String type) {
    if (type == "email") {
      final emailList = Hive.box("email");
      for (int i = 0; i < emailList.length; i++) {
        final model = emailList.getAt(i) as EmailHiveModel;
        if (model.data == data) {
          emailList.deleteAt(i);
        }
      }
    } else if (type == "event") {
      final eventList = Hive.box("event");
      for (int i = 0; i < eventList.length; i++) {
        final model = eventList.getAt(i) as EventHiveModel;
        if (model.data == data) {
          eventList.deleteAt(i);
        }
      }
    } else if (type == "sms") {
      final smsList = Hive.box("sms");
      for (int i = 0; i < smsList.length; i++) {
        final model = smsList.getAt(i) as SmsHiveModel;
        if (model.data == data) {
          smsList.deleteAt(i);
        }
      }
    } else if (type == "url") {
      final urlList = Hive.box("url");
      for (int i = 0; i < urlList.length; i++) {
        final model = urlList.getAt(i) as UrlHiveModel;
        if (model.data == data) {
          urlList.deleteAt(i);
        }
      }
    } else if (type == "vcard") {
      final vcardLIst = Hive.box("vcard");
      for (int i = 0; i < vcardLIst.length; i++) {
        final model = vcardLIst.getAt(i) as VCardHiveModel;
        if (model.data == data) {
          vcardLIst.deleteAt(i);
        }
      }
    } else if (type == "wifi") {
      final wifiList = Hive.box("wifi");
      for (int i = 0; i < wifiList.length; i++) {
        final model = wifiList.getAt(i) as WifiHiveModel;
        if (model.data == data) {
          wifiList.deleteAt(i);
        }
      }
    }
  }
}
