import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code/resources/resources.dart';

reusableText(String text,
    {double fontSize = 16,
    Color fontColor = ColorProvider.mainNavBar,
    FontWeight fontWeight = FontWeight.w500,
    double letterSpacing = 0,
    TextAlign textAlign = TextAlign.start}) {
  return Text(
    text,
    textAlign: textAlign,
    style: GoogleFonts.notoSans(
        fontSize: fontSize.sp,
        color: fontColor,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing),
  );
}