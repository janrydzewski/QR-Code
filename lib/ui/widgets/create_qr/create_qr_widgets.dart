import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code/resources/resources.dart';
import 'package:qr_code/ui/widgets/common_widgets.dart';

reusableTextFormField(String text) {
  return Container(
    width: 375.w,
    height: 100.h,
    margin: EdgeInsets.symmetric(horizontal: 35.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        reusableText(text, fontColor: Colors.white),
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
          decoration: const InputDecoration(
            fillColor: ColorProvider.mainElement,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorProvider.mainElement),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorProvider.mainElement),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorProvider.mainElement),
            ),
          ),
        ),
      ],
    ),
  );
}

reusableElevatedButton() {
  return Container(
    width: 375.w,
    height: 40.h,
    margin: EdgeInsets.symmetric(horizontal: 100.w),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorProvider.mainNavBarElementSelected,
      ),
      onPressed: () {},
      child: reusableText("Create QR", fontColor: Colors.white),
    ),
  );
}
