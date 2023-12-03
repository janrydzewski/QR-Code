import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:qr_code/bloc/bloc.dart';
import 'package:qr_code/models/qr_codes/qr_codes.dart';
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

Widget qrCardWidget(Widget child1, Widget child2, String data, String type,
    BuildContext context,
    {double height = 140}) {
  return Container(
    width: 375.w,
    height: height.h,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: ColorProvider.mainElement,
        borderRadius: BorderRadius.circular(15)),
    margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    child: Stack(
      children: [
        Row(
          children: [
            child1,
            child2,
          ],
        ),
        Positioned(
          top: 0,
          right: 0,
          child: GestureDetector(
            onTap: () {
              context
                  .read<ListBloc>()
                  .add(DeleteElementFromListEvent(data, type));
              context
                  .read<ListBloc>()
                  .add(ChangeIndexEvent(context.read<ListBloc>().state.index));
            },
            child: Icon(
              Icons.delete_outline,
              color: Colors.white,
              size: 25.w,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget listWidget(ListState state) {
  if (state is ListCombinedState) {
    return SizedBox(
      width: 375.w,
      height: 500.w,
      child: state.emailList.isNotEmpty ||
              state.eventList.isNotEmpty ||
              state.smsList.isNotEmpty ||
              state.urlList.isNotEmpty ||
              state.vcardList.isNotEmpty ||
              state.wifiList.isNotEmpty
          ? SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.emailList.length,
                    itemBuilder: (context, index) {
                      final element = state.emailList[index].emailModel;
                      return GestureDetector(
                        onTap: () {
                          context.read<CreateQrBloc>().add(
                                ShowEmailEvent(
                                  EmailModel(element.email, element.subject,
                                      element.message),
                                ),
                              );
                          context.go("/list/showQr");
                        },
                        child: qrCardWidget(
                          qrCodeWidget(state.emailList[index].data),
                          threeElementExpandedColumn(
                              "Email",
                              element.email,
                              "Subject",
                              element.subject,
                              "Message",
                              element.message),
                          state.emailList[index].data,
                          "email",
                          context,
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.eventList.length,
                    itemBuilder: (context, index) {
                      final element = state.eventList[index].eventModel;
                      return GestureDetector(
                        onTap: () {
                          context.read<CreateQrBloc>().add(
                                ShowEventEvent(
                                  EventModel(element.title, element.startDate,
                                      element.endDate),
                                ),
                              );
                          context.go("/list/showQr");
                        },
                        child: qrCardWidget(
                          qrCodeWidget(state.eventList[index].data),
                          threeElementExpandedColumn(
                            "Title",
                            element.title,
                            "Start at",
                            DateFormat('yyyy/MM/dd HH:mm')
                                .format(DateTime.parse(element.startDate))
                                .toString(),
                            "End at",
                            DateFormat('yyyy/MM/dd HH:mm')
                                .format(DateTime.parse(element.endDate))
                                .toString(),
                          ),
                          state.eventList[index].data,
                          "event",
                          context,
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.smsList.length,
                    itemBuilder: (context, index) {
                      final element = state.smsList[index].smsModel;
                      return GestureDetector(
                        onTap: () {
                          context.read<CreateQrBloc>().add(
                                ShowSmsEvent(
                                  SmsModel(
                                    element.number,
                                    element.message,
                                  ),
                                ),
                              );
                          context.go("/list/showQr");
                        },
                        child: qrCardWidget(
                          qrCodeWidget(state.smsList[index].data),
                          twoElementExpandedColumn("Phone number",
                              element.number, "Message", element.message),
                          state.smsList[index].data,
                          "sms",
                          context,
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.urlList.length,
                    itemBuilder: (context, index) {
                      final element = state.urlList[index].urlModel;
                      return GestureDetector(
                        onTap: () {
                          context.read<CreateQrBloc>().add(
                                ShowUrlEvent(
                                  UrlModel(
                                    element.url,
                                  ),
                                ),
                              );
                          context.go("/list/showQr");
                        },
                        child: qrCardWidget(
                          qrCodeWidget(state.urlList[index].data),
                          oneElementExpandedColumn("Url", element.url),
                          state.urlList[index].data,
                          "url",
                          context,
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.vcardList.length,
                    itemBuilder: (context, index) {
                      final element = state.vcardList[index].vCardModel;
                      return GestureDetector(
                        onTap: () {
                          context.read<CreateQrBloc>().add(
                                ShowVCardEvent(
                                  VCardModel(
                                      element.firstName,
                                      element.lastName,
                                      element.number,
                                      element.nickname,
                                      element.url,
                                      "",
                                      "",
                                      "",
                                      element.birthDay,
                                      element.note),
                                ),
                              );
                          context.go("/list/showQr");
                        },
                        child: qrCardWidget(
                            qrCodeWidget(state.vcardList[index].data),
                            nineElementExpandedColumn(
                              "First Name",
                              element.firstName,
                              "Last Name",
                              element.lastName,
                              "Phone Number",
                              element.number,
                              "Nickname",
                              element.nickname,
                              "Url",
                              element.url,
                              "Birthday",
                              element.birthDay,
                              "Note",
                              element.note,
                            ),
                            state.vcardList[index].data,
                            "vcard",
                            context,
                            height: 350),
                      );
                    },
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.wifiList.length,
                    itemBuilder: (context, index) {
                      final element = state.wifiList[index].wifiModel;
                      return GestureDetector(
                        onTap: () {
                          context.read<CreateQrBloc>().add(
                                ShowWifiEvent(
                                  WifiModel(element.networkName,
                                      element.password, element.security),
                                ),
                              );
                          context.go("/list/showQr");
                        },
                        child: qrCardWidget(
                          qrCodeWidget(state.wifiList[index].data),
                          threeElementExpandedColumn(
                              "SSID",
                              element.networkName,
                              "Password",
                              element.password,
                              "Security",
                              element.security),
                          state.wifiList[index].data,
                          "wifi",
                          context,
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          : Center(
              child: reusableText("You haven't created any qr code yet.",
                  fontColor: Colors.white),
            ),
    );
  }
  if (state is ListEmailState) {
    return SizedBox(
      width: 375.w,
      height: 500.w,
      child: state.qrList.isNotEmpty
          ? ListView.builder(
              itemCount: state.qrList.length,
              itemBuilder: (context, index) {
                final element = state.qrList[index].emailModel;
                return GestureDetector(
                        onTap: () {
                          context.read<CreateQrBloc>().add(
                                ShowEmailEvent(
                                  EmailModel(element.email, element.subject,
                                      element.message),
                                ),
                              );
                          context.go("/list/showQr");
                        },
                        child: qrCardWidget(
                          qrCodeWidget(state.qrList[index].data),
                          threeElementExpandedColumn(
                              "Email",
                              element.email,
                              "Subject",
                              element.subject,
                              "Message",
                              element.message),
                          state.qrList[index].data,
                          "email",
                          context,
                        ),
                      );
              },
            )
          : Center(
              child: reusableText("You haven't created any qr code yet.",
                  fontColor: Colors.white),
            ),
    );
  }
  if (state is ListEventState) {
    return SizedBox(
      width: 375.w,
      height: 500.w,
      child: state.qrList.isNotEmpty
          ? ListView.builder(
              itemCount: state.qrList.length,
              itemBuilder: (context, index) {
                final element = state.qrList[index].eventModel;
                return GestureDetector(
                        onTap: () {
                          context.read<CreateQrBloc>().add(
                                ShowEventEvent(
                                  EventModel(element.title, element.startDate,
                                      element.endDate),
                                ),
                              );
                          context.go("/list/showQr");
                        },
                        child: qrCardWidget(
                          qrCodeWidget(state.qrList[index].data),
                          threeElementExpandedColumn(
                            "Title",
                            element.title,
                            "Start at",
                            DateFormat('yyyy/MM/dd HH:mm')
                                .format(DateTime.parse(element.startDate))
                                .toString(),
                            "End at",
                            DateFormat('yyyy/MM/dd HH:mm')
                                .format(DateTime.parse(element.endDate))
                                .toString(),
                          ),
                          state.qrList[index].data,
                          "event",
                          context,
                        ),
                      );
              },
            )
          : Center(
              child: reusableText("You haven't created any qr code yet.",
                  fontColor: Colors.white),
            ),
    );
  }
  if (state is ListSmsState) {
    return SizedBox(
      width: 375.w,
      height: 500.w,
      child: state.qrList.isNotEmpty
          ? ListView.builder(
              itemCount: state.qrList.length,
              itemBuilder: (context, index) {
                final element = state.qrList[index].smsModel;
                return GestureDetector(
                        onTap: () {
                          context.read<CreateQrBloc>().add(
                                ShowSmsEvent(
                                  SmsModel(
                                    element.number,
                                    element.message,
                                  ),
                                ),
                              );
                          context.go("/list/showQr");
                        },
                        child: qrCardWidget(
                          qrCodeWidget(state.qrList[index].data),
                          twoElementExpandedColumn("Phone number",
                              element.number, "Message", element.message),
                          state.qrList[index].data,
                          "sms",
                          context,
                        ),
                      );
              },
            )
          : Center(
              child: reusableText("You haven't created any qr code yet.",
                  fontColor: Colors.white),
            ),
    );
  }
  if (state is ListUrlState) {
    return SizedBox(
      width: 375.w,
      height: 500.w,
      child: state.qrList.isNotEmpty
          ? ListView.builder(
              itemCount: state.qrList.length,
              itemBuilder: (context, index) {
                final element = state.qrList[index].urlModel;
                return GestureDetector(
                        onTap: () {
                          context.read<CreateQrBloc>().add(
                                ShowUrlEvent(
                                  UrlModel(
                                    element.url,
                                  ),
                                ),
                              );
                          context.go("/list/showQr");
                        },
                        child: qrCardWidget(
                          qrCodeWidget(state.qrList[index].data),
                          oneElementExpandedColumn("Url", element.url),
                          state.qrList[index].data,
                          "url",
                          context,
                        ),
                      );
              },
            )
          : Center(
              child: reusableText("You haven't created any qr code yet.",
                  fontColor: Colors.white),
            ),
    );
  }
  if (state is ListVCardState) {
    return SizedBox(
      width: 375.w,
      height: 500.w,
      child: state.qrList.isNotEmpty
          ? ListView.builder(
              itemCount: state.qrList.length,
              itemBuilder: (context, index) {
                final element = state.qrList[index].vCardModel;
                return GestureDetector(
                        onTap: () {
                          context.read<CreateQrBloc>().add(
                                ShowVCardEvent(
                                  VCardModel(
                                      element.firstName,
                                      element.lastName,
                                      element.number,
                                      element.nickname,
                                      element.url,
                                      "",
                                      "",
                                      "",
                                      element.birthDay,
                                      element.note),
                                ),
                              );
                          context.go("/list/showQr");
                        },
                        child: qrCardWidget(
                            qrCodeWidget(state.qrList[index].data),
                            nineElementExpandedColumn(
                              "First Name",
                              element.firstName,
                              "Last Name",
                              element.lastName,
                              "Phone Number",
                              element.number,
                              "Nickname",
                              element.nickname,
                              "Url",
                              element.url,
                              "Birthday",
                              element.birthDay,
                              "Note",
                              element.note,
                            ),
                            state.qrList[index].data,
                            "vcard",
                            context,
                            height: 350),
                      );
              },
            )
          : Center(
              child: reusableText("You haven't created any qr code yet.",
                  fontColor: Colors.white),
            ),
    );
  }
  if (state is ListWifiState) {
    return SizedBox(
      width: 375.w,
      height: 500.w,
      child: state.qrList.isNotEmpty
          ? ListView.builder(
              itemCount: state.qrList.length,
              itemBuilder: (context, index) {
                final element = state.qrList[index].wifiModel;
                return GestureDetector(
                        onTap: () {
                          context.read<CreateQrBloc>().add(
                                ShowWifiEvent(
                                  WifiModel(element.networkName,
                                      element.password, element.security),
                                ),
                              );
                          context.go("/list/showQr");
                        },
                        child: qrCardWidget(
                          qrCodeWidget(state.qrList[index].data),
                          threeElementExpandedColumn(
                              "SSID",
                              element.networkName,
                              "Password",
                              element.password,
                              "Security",
                              element.security),
                          state.qrList[index].data,
                          "wifi",
                          context,
                        ),
                      );
              },
            )
          : Center(
              child: reusableText("You haven't created any qr code yet.",
                  fontColor: Colors.white),
            ),
    );
  }
  return Container();
}

titleElementOfExpandedColumn(String text) {
  return reusableText(
    "${text}:",
    fontSize: 13,
    fontWeight: FontWeight.w600,
    fontColor: Colors.white,
  );
}

bodyElementOfExpandedColumn(String text) {
  return reusableText(
    text,
    maxLines: 1,
    fontSize: 10,
    fontColor: Colors.white,
  );
}

elementOfExpandedColumn(String text1, String text2) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      titleElementOfExpandedColumn(text1),
      SizedBox(
        height: 2.h,
      ),
      bodyElementOfExpandedColumn(text2),
    ],
  );
}

oneElementExpandedColumn(
  String text1,
  String text2,
) {
  return Expanded(
    child: Container(
      height: 130.h,
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          elementOfExpandedColumn(text1, text2),
        ],
      ),
    ),
  );
}

twoElementExpandedColumn(
    String text1, String text2, String text3, String text4) {
  return Expanded(
    child: Container(
      height: 130.h,
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          elementOfExpandedColumn(text1, text2),
          elementOfExpandedColumn(text3, text4),
        ],
      ),
    ),
  );
}

threeElementExpandedColumn(String text1, String text2, String text3,
    String text4, String text5, String text6) {
  return Expanded(
    child: Container(
      height: 130.h,
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          elementOfExpandedColumn(text1, text2),
          elementOfExpandedColumn(text3, text4),
          elementOfExpandedColumn(text5, text6),
        ],
      ),
    ),
  );
}

nineElementExpandedColumn(
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
  return Expanded(
    child: Container(
      height: 350.h,
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          elementOfExpandedColumn(text1, text2),
          elementOfExpandedColumn(text3, text4),
          elementOfExpandedColumn(text5, text6),
          elementOfExpandedColumn(text7, text8),
          elementOfExpandedColumn(text9, text10),
          elementOfExpandedColumn(text11, text12),
          elementOfExpandedColumn(text13, text14),
        ],
      ),
    ),
  );
}
