import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code/resources/resources.dart';
import 'package:qr_code/ui/widgets/common_widgets.dart';

Widget homeMainElementWidget(String text, IconData iconData, Color color) {
  return Container(
    height: 150.w,
    width: 150.w,
    color: ColorProvider.mainElement,
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 15.w),
          width: 75.w,
          height: 75.w,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: color, boxShadow: [
            BoxShadow(
              color: color,
              blurRadius: 10.0,
              spreadRadius: 1.0,
            ),
          ],),
          child: Icon(
            iconData,
            size: 33.w,
          ),
        ),
        reusableText(text, fontColor: color),
      ],
    ),
  );
}

List<Widget> homeMainElements() {
  return [
    homeMainElementWidget("VCard", Icons.contact_emergency, Colors.white),
    homeMainElementWidget("Wifi", Icons.wifi, Colors.white),
    homeMainElementWidget("Sms", Icons.message, Colors.white),
    homeMainElementWidget("Url", Icons.web, Colors.white),
    homeMainElementWidget("Email", Icons.email, Colors.white),
    homeMainElementWidget("Facebook", Icons.facebook, Colors.white),
  ];
}
