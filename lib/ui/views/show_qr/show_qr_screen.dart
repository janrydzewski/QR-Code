import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              return Column(
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
              );
            },
          ),
        ),
      ),
    );
  }
}
