import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code/repositories/list_repository.dart';
import 'package:qr_code/resources/resources.dart';
import 'package:qr_code/ui/ui.dart';
import 'package:qr_flutter/qr_flutter.dart';

reusableRow(String text1, String text2) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
    child: Row(
      children: [
        reusableText(text1,
            fontColor: ColorProvider.mainNavBarElementSelected, fontWeight: FontWeight.w600,),
        const SizedBox(
          width: 5,
        ),
        reusableText(text2,
            fontColor: Colors.white, fontWeight: FontWeight.w300),
      ],
    ),
  );
}

qrCodeMainWidget(String data, GlobalKey globalKey) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 50.h),
    width: 375.w,
    height: 250.w,
    alignment: Alignment.center,
    child: RepaintBoundary(
      key: globalKey,
      child: QrImageView(
        data: data,
        version: QrVersions.auto,
        backgroundColor: Colors.white,
      ),
    ),
  );
}

topBarMainWidget(String text, GlobalKey globalKey, BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 15.h, right: 10.w, left: 10.w),
    child: AppBar(
      title: reusableText(text, fontColor: Colors.white, fontSize: 24),
      backgroundColor: ColorProvider.mainBackground,
      shadowColor: Colors.transparent,
      automaticallyImplyLeading: false,
      actions: [
        Theme(
          data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent),
          child: IconButton(
            onPressed: () {
              const ListRepository().saveAndShare(globalKey, context);
            },
            icon: const Icon(
              Icons.ios_share,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}

threeElementExpandedColumnWidget(String text1, String text2, String text3,
    String text4, String text5, String text6) {
  return Container(
    margin: const EdgeInsets.symmetric(
      horizontal: 20,
    ),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          15,
        ),
        color: ColorProvider.mainElement),
    child: Column(
      children: [
        reusableRow(
          text1,
          text2,
        ),
        reusableRow(
          text3,
          text4,
        ),
        reusableRow(
          text5,
          text6,
        ),
      ],
    ),
  );
}

twoElementExpandedColumnWidget(
    String text1, String text2, String text3, String text4) {
  return Container(
    margin: const EdgeInsets.symmetric(
      horizontal: 20,
    ),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          15,
        ),
        color: ColorProvider.mainElement),
    child: Column(
      children: [
        reusableRow(
          text1,
          text2,
        ),
        reusableRow(
          text3,
          text4,
        ),
      ],
    ),
  );
}

oneElementExpandedColumnWidget(String text1, String text2) {
  return Container(
    margin: const EdgeInsets.symmetric(
      horizontal: 20,
    ),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          15,
        ),
        color: ColorProvider.mainElement),
    child: Column(
      children: [
        reusableRow(
          text1,
          text2,
        ),
      ],
    ),
  );
}

tenElementExpandedColumnWidget(
  String text1,
  String text2,
  String text3,
  String text4,
  String text5,
  String text6,
  String text7,
  String text8,
  String text9,
  String text10,
  String text11,
  String text12,
  String text13,
  String text14,
) {
  return Container(
    margin: const EdgeInsets.symmetric(
      horizontal: 20,
    ),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          15,
        ),
        color: ColorProvider.mainElement),
    child: Column(
      children: [
        reusableRow(text1, text2),
        reusableRow(text3, text4),
        reusableRow(text5, text6),
        reusableRow(text7, text8),
        reusableRow(text9, text10),
        reusableRow(text11, text12),
        reusableRow(text13, text14),
      ],
    ),
  );
}
