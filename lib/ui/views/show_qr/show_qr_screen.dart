import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:qr_code/bloc/bloc.dart';
import 'package:qr_code/resources/resources.dart';
import 'package:qr_code/ui/ui.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ShowQrScreen extends StatefulWidget {
  const ShowQrScreen({super.key});

  @override
  State<ShowQrScreen> createState() => _ShowQrScreenState();
}

class _ShowQrScreenState extends State<ShowQrScreen> {
  final GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 812.h,
      width: 375.w,
      child: Scaffold(
        backgroundColor: ColorProvider.mainBackground,
        body: SafeArea(
          child: BlocConsumer<CreateQrBloc, CreateQrState>(
            listener: (context, state) {
              if (state is CreateQrError) {
                Center(
                  child: reusableText(state.message, fontColor: Colors.white),
                );
              }
            },
            builder: (context, state) {
              if (state is CreateQrLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: ColorProvider.mainElement,
                  ),
                );
              }
              if (state is CreateEmailState) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      topBarMainWidget("Email", globalKey, context),
                      qrCodeMainWidget(state.model.data, globalKey),
                      threeElementExpandedColumnWidget(
                        "Email: ",
                        state.model.emailModel.email,
                        "Subject: ",
                        state.model.emailModel.subject,
                        "Message: ",
                        state.model.emailModel.message,
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                    ],
                  ),
                );
              }
              if (state is CreateEventState) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      topBarMainWidget("Event", globalKey, context),
                      qrCodeMainWidget(state.model.data, globalKey),
                      threeElementExpandedColumnWidget(
                        "Title: ",
                        state.model.eventModel.title,
                        "Start Date: ",
                        DateFormat('yyyy/MM/dd HH:mm')
                            .format(DateTime.parse(
                                state.model.eventModel.startDate))
                            .toString(),
                        "End Date: ",
                        DateFormat('yyyy/MM/dd HH:mm')
                            .format(
                                DateTime.parse(state.model.eventModel.endDate))
                            .toString(),
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                    ],
                  ),
                );
              }
              if (state is CreateSmsState) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      topBarMainWidget("Sms", globalKey, context),
                      qrCodeMainWidget(state.model.data, globalKey),
                      twoElementExpandedColumnWidget(
                        "Email: ",
                        state.model.smsModel.number,
                        "Subject: ",
                        state.model.smsModel.message,
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                    ],
                  ),
                );
              }
              if (state is CreateUrlState) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      topBarMainWidget("Url", globalKey, context),
                      qrCodeMainWidget(state.model.data, globalKey),
                      oneElementExpandedColumnWidget(
                        "Url: ",
                        state.model.urlModel.url,
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                    ],
                  ),
                );
              }
              if (state is CreateVCardState) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      topBarMainWidget("VCard", globalKey, context),
                      qrCodeMainWidget(state.model.data, globalKey),
                      tenElementExpandedColumnWidget(
                        "First Name: ",
                        state.model.vCardModel.firstName,
                        "Last Date: ",
                        state.model.vCardModel.lastName,
                        "Photo Number: ",
                        state.model.vCardModel.number,
                        "Nickname: ",
                        state.model.vCardModel.nickname,
                        "Url: ",
                        state.model.vCardModel.url,
                        "Birthday: ",
                        state.model.vCardModel.birthDay,
                        "Note: ",
                        state.model.vCardModel.note,
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                    ],
                  ),
                );
              }
              if (state is CreateWifiState) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      topBarMainWidget("Wifi", globalKey, context),
                      qrCodeMainWidget(state.model.data, globalKey),
                      threeElementExpandedColumnWidget(
                          "Network: ",
                          state.model.wifiModel.networkName,
                          "Password: ",
                          state.model.wifiModel.password,
                          "Security: ",
                          state.model.wifiModel.security),
                      SizedBox(
                        height: 100.h,
                      ),
                    ],
                  ),
                );
              }
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 375.w,
                      height: 250.w,
                      alignment: Alignment.center,
                      child: QrImageView(
                        data: state.dataCode,
                        version: QrVersions.auto,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
