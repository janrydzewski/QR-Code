import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code/bloc/bloc.dart';
import 'package:qr_code/resources/resources.dart';
import 'package:qr_code/ui/ui.dart';
import 'package:qr_flutter/qr_flutter.dart';

Widget topBarWidget(ListState state) {
  return Container(
    height: 60.h,
    width: 375.w,
    margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 7,
      itemBuilder: (context, index) {
        String text = "";
        switch (index) {
          case 0:
            text = "All";
          case 1:
            text = "Email";
          case 2:
            text = "Event";
          case 3:
            text = "Sms";
          case 4:
            text = "Url";
          case 5:
            text = "VCard";
          case 6:
            text = "Wifi";
        }
        return GestureDetector(
          onTap: () {
            context.read<ListBloc>().add(
                  ChangeIndexEvent(index),
                );
          },
          child: topBarElementWidget(
            text,
            state.index == index ? true : false,
          ),
        );
      },
    ),
  );
}

Widget topBarElementWidget(String text, bool isSelected) {
  return Container(
      width: 100.w,
      alignment: Alignment.center,
      child: Column(
        children: [
          reusableText(text,
              fontColor: isSelected ? Colors.white : Colors.white10,
              fontSize: 18),
          SizedBox(
            height: 10.h,
          ),
          Divider(
            color: isSelected ? Colors.white : Colors.white10,
            thickness: isSelected ? 2 : 1,
          )
        ],
      ));
}



Widget qrCodeWidget(String data) {
  return QrImageView(
                  size: 120.h,
                  data: data,
                  version: QrVersions.auto,
                  backgroundColor: Colors.white,
                );
}

Widget listWidget(ListState state) {
  if (state is ListEmailState) {
    return Container(
      width: 375.w,
      height: 500.w,
      child: ListView.builder(
        itemCount: state.qrList.length,
        itemBuilder: (context, index) {
          final element = state.qrList[index].emailModel;
          return Container(
            width: 375.w,
            height: 150.h,
            decoration: BoxDecoration(
                color: ColorProvider.mainElement,
                borderRadius: BorderRadius.circular(15)),
            margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                qrCodeWidget(state.qrList[index].data),
                Expanded(
                  child: Container(
                    height: 130.h,
                    margin: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            reusableText(
                              "Email:",
                              fontSize: 12,
                              fontColor: Colors.white,
                            ),
                            reusableText(
                              element.email,
                              maxLines: 1,
                              fontSize: 10,
                              fontColor: Colors.white,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            reusableText(
                              "Subject:",
                              fontSize: 12,
                              fontColor: Colors.white,
                            ),
                            reusableText(
                              element.subject,
                              maxLines: 1,
                              fontSize: 10,
                              fontColor: Colors.white,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            reusableText(
                              "Message",
                              fontSize: 12,
                              fontColor: Colors.white,
                            ),
                            reusableText(
                              element.message,
                              maxLines: 3,
                              fontSize: 10,
                              fontColor: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  if (state is ListEventState) {
    return Container(
      width: 300.w,
      height: 300.w,
      child: ListView.builder(
        itemCount: state.qrList.length,
        itemBuilder: (context, index) {
          return QrImageView(
                  size: 120.h,
                  data: state.qrList[index].data,
                  version: QrVersions.auto,
                  backgroundColor: Colors.white,
                );
        },
      ),
    );
  }
  if (state is ListSmsState) {
    return Container(
      width: 300.w,
      height: 300.w,
      child: ListView.builder(
        itemCount: state.qrList.length,
        itemBuilder: (context, index) {
          return QrImageView(
                  size: 120.h,
                  data: state.qrList[index].data,
                  version: QrVersions.auto,
                  backgroundColor: Colors.white,
                );
        },
      ),
    );
  }
  if (state is ListUrlState) {
    return Container(
      width: 300.w,
      height: 300.w,
      child: ListView.builder(
        itemCount: state.qrList.length,
        itemBuilder: (context, index) {
          return QrImageView(
                  size: 120.h,
                  data: state.qrList[index].data,
                  version: QrVersions.auto,
                  backgroundColor: Colors.white,
                );
        },
      ),
    );
  }
  if (state is ListVCardState) {
    return Container(
      width: 300.w,
      height: 300.w,
      child: ListView.builder(
        itemCount: state.qrList.length,
        itemBuilder: (context, index) {
          return QrImageView(
                  size: 120.h,
                  data: state.qrList[index].data,
                  version: QrVersions.auto,
                  backgroundColor: Colors.white,
                );
        },
      ),
    );
  }
  if (state is ListWifiState) {
    return Container(
      width: 300.w,
      height: 300.w,
      child: ListView.builder(
        itemCount: state.qrList.length,
        itemBuilder: (context, index) {
          return QrImageView(
                  size: 120.h,
                  data: state.qrList[index].data,
                  version: QrVersions.auto,
                  backgroundColor: Colors.white,
                );
        },
      ),
    );
  }
  return Container();
}
