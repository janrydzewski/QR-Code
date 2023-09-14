import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_code/resources/resources.dart';
import 'package:qr_code/ui/widgets/create_qr/create_qr.dart';

class WifiScreen extends StatefulWidget {
  const WifiScreen({super.key});

  @override
  State<WifiScreen> createState() => _VCardScreenState();
}

class _VCardScreenState extends State<WifiScreen> {
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
                reusableTextFormField("Network Name"),
                reusableTextFormField("Password"),
                reusableTextFormField("Company"),
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
