import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code/models/models.dart';
import 'package:share/share.dart';

class ListRepository {
  const ListRepository();

  List<EmailHiveModel> getEmailQrList() {
    final emailQrList = Hive.box("emailBox");
    return emailQrList.values.cast<EmailHiveModel>().toList();
  }

  List<EventHiveModel> getEventQrList() {
    final eventQrList = Hive.box("eventBox");
    return eventQrList.values.cast<EventHiveModel>().toList();
  }

  List<SmsHiveModel> getSmsQrList() {
    final smsQrList = Hive.box("smsBox");
    return smsQrList.values.cast<SmsHiveModel>().toList();
  }

  List<UrlHiveModel> getUrlQrList() {
    final urlQrList = Hive.box("urlBox");
    return urlQrList.values.cast<UrlHiveModel>().toList();
  }

  List<VCardHiveModel> getVCardQrList() {
    final vCardQrList = Hive.box("vcardBox");
    return vCardQrList.values.cast<VCardHiveModel>().toList();
  }

  List<WifiHiveModel> getWifiQrList() {
    final wifiQrList = Hive.box("wifiBox");
    return wifiQrList.values.cast<WifiHiveModel>().toList();
  }

  void deleteModelFromFavourite(String data, String type) {
    if (type == "email") {
      final emailList = Hive.box("emailBox");
      for (int i = 0; i < emailList.length; i++) {
        final model = emailList.getAt(i) as EmailHiveModel;
        if (model.data == data) {
          emailList.deleteAt(i);
        }
      }
    } else if (type == "event") {
      final eventList = Hive.box("eventBox");
      for (int i = 0; i < eventList.length; i++) {
        final model = eventList.getAt(i) as EventHiveModel;
        if (model.data == data) {
          eventList.deleteAt(i);
        }
      }
    } else if (type == "sms") {
      final smsList = Hive.box("smsBox");
      for (int i = 0; i < smsList.length; i++) {
        final model = smsList.getAt(i) as SmsHiveModel;
        if (model.data == data) {
          smsList.deleteAt(i);
        }
      }
    } else if (type == "url") {
      final urlList = Hive.box("urlBox");
      for (int i = 0; i < urlList.length; i++) {
        final model = urlList.getAt(i) as UrlHiveModel;
        if (model.data == data) {
          urlList.deleteAt(i);
        }
      }
    } else if (type == "vcard") {
      final vcardLIst = Hive.box("vcardBox");
      for (int i = 0; i < vcardLIst.length; i++) {
        final model = vcardLIst.getAt(i) as VCardHiveModel;
        if (model.data == data) {
          vcardLIst.deleteAt(i);
        }
      }
    } else if (type == "wifi") {
      final wifiList = Hive.box("wifiBox");
      for (int i = 0; i < wifiList.length; i++) {
        final model = wifiList.getAt(i) as WifiHiveModel;
        if (model.data == data) {
          wifiList.deleteAt(i);
        }
      }
    }
  }

  Future<void> saveAndShare(GlobalKey globalKey, BuildContext context) async {
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage();
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      await Permission.storage.request();

      final directory = (await getApplicationDocumentsDirectory()).path;

      File imgFile = File('$directory/screenshot.png');
      imgFile.writeAsBytes(pngBytes);

      final RenderBox box = context.findRenderObject() as RenderBox;
      Share.shareFiles(['$directory/screenshot.png'],
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    } catch (e) {
      print(e.toString());
    }
  }
}
