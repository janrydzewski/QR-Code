import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code/resources/resources.dart';
import 'package:qr_code/ui/ui.dart';

Widget homeMainElementWidget(
    String text, IconData iconData, Color color, BuildContext context) {
  return GestureDetector(
    onTap: () {
      context.go('/home/${text.toLowerCase()}');
    },
    child: Container(
      height: 150.w,
      width: 150.w,
      decoration: BoxDecoration(
          color: ColorProvider.mainElement,
          borderRadius: BorderRadius.circular(25)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15.w),
            width: 75.w,
            height: 75.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              boxShadow: [
                BoxShadow(
                  color: color,
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
            child: Icon(
              iconData,
              size: 33.w,
              color: Colors.white,
            ),
          ),
          reusableText(text, fontColor: color),
        ],
      ),
    ),
  );
}

List<Widget> homeMainElements(BuildContext context) {
  return [
    homeMainElementWidget(
        "VCard", Icons.contact_emergency, const Color(0xFF14c349), context),
    homeMainElementWidget("Wifi", Icons.wifi, const Color(0xFF5b83ee), context),
    homeMainElementWidget(
        "Sms", Icons.message, const Color(0xFF7850f5), context),
    homeMainElementWidget("Url", Icons.web, const Color(0xFFf451d8), context),
    homeMainElementWidget(
        "Email", Icons.email, const Color(0xFF329bef), context),
    homeMainElementWidget(
        "Event", Icons.calendar_month, const Color(0xFFf48842), context),
  ];
}
