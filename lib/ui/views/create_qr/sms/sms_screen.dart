import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code/resources/resources.dart';
import 'package:qr_code/ui/widgets/create_qr/create_qr.dart';

class SmsScreen extends StatefulWidget {
  const SmsScreen({super.key});

  @override
  State<SmsScreen> createState() => _VCardScreenState();
}

class _VCardScreenState extends State<SmsScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 812.h,
      width: 375.w,
      child: Scaffold(
        backgroundColor: ColorProvider.mainBackground,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                reusableTextFormField("Number"),
                reusableTextFormField("Message"),
                reusableElevatedButton(),
                SizedBox(
                  height: 80.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
