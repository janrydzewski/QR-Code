import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code/ui/ui.dart';

reusableRow(String text1, String text2) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 35.w),
    child: Row(
      children: [
        reusableText(text1, fontColor: Colors.white),
        reusableText(text2, fontColor: Colors.white),
      ],
    ),
  );
}
